
locals {
  instance_name_format = "%s%02d"
  # convert network interface list to dict
  # use device_index as "key"
  network_interfaces_map = {for s in var.aws_instance_network_interfaces : s.device_index => s}
  # this allow us to change device user list
  # without altering existing objects
  network_full = [
    for i in range(var.aws_instance_count): [
      for n in var.aws_instance_network_interfaces:
        merge( { instance_index = i }, n )
      ]
  ]
}

data "aws_ami" "ami" {

  executable_users = var.aws_ami_executable_users
  most_recent      = var.aws_ami_most_recent
  name_regex       = var.aws_ami_name_regex
  owners           = var.aws_ami_owners

  dynamic "filter" {
    for_each = var.aws_ami_filters
    iterator = each
    content {
      name = each.value.name
      values = each.value.values
    }
  }
}

resource "aws_network_interface" "network_interface" {
  for_each = {
    for x in flatten(local.network_full):
      format("i-%d-eni-%d", x.instance_index +1, x.device_index) => x
  }

  subnet_id = each.value.subnet_id
  security_groups = each.value.security_groups
  ipv6_address_count = each.value.ipv6_address_count
  private_ips_count = each.value.private_ips_count

  # due to count on instance object
  # we cannot assign private_ip from this loop
  # private_ips = each.value.private_ips

  tags = merge(
    {
      "Name" = format("${local.instance_name_format}-eni-%d",
        var.aws_instance_name, each.value.instance_index + 1, each.value.device_index)
    },
    var.tags,
    var.aws_instance_tags,
  )
}

resource "aws_instance" "instance" {
  count = var.aws_instance_count

  ami           = data.aws_ami.ami.id
  instance_type = var.aws_instance_instance_type

  dynamic "network_interface" {
    for_each = local.network_full[count.index]
    iterator = each
    content {
      device_index         = each.value.device_index
      network_interface_id = aws_network_interface.network_interface[format("i-%d-eni-%d", each.value.instance_index + 1, each.value.device_index)].id
    }
  }

  tags = merge(
    {
      "Name" = format(local.instance_name_format, var.aws_instance_name, count.index + 1)
      "ImageId" = data.aws_ami.ami.image_id
      "ImageName" = data.aws_ami.ami.name
      "ImageOwnerAlias" = data.aws_ami.ami.image_owner_alias
      "ImageOwnerId" = data.aws_ami.ami.owner_id
      "ImageVirtualizationType" = data.aws_ami.ami.virtualization_type
      "ImagePlatform" = data.aws_ami.ami.platform
    },
    var.tags,
    var.aws_instance_tags,
  )
}

