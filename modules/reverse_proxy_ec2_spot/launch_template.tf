data "aws_ami" "reverse_proxy_ami" {
  most_recent = true
  owners      = ["self"]

  filter {
    name   = "name"
    values = ["apig-reverse-proxy-eu2-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_ami" "bastion_ami" {
  most_recent = true
  owners      = ["self"]

  filter {
    name   = "name"
    values = ["apig-bastion-eu2-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_launch_template" "ccs_api_gateway_reverse_proxy_bastion_launch_template" {
  image_id      = data.aws_ami.bastion_ami.id
  instance_type = var.bastion_ec2_instance_type
  key_name      = var.ec2_key_pair_name
  name          = "${var.ccs_api_gateway_reverse_proxy_bastion_component_name}_bastion_launch_template"

  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      delete_on_termination = "true"
      encrypted             = "true"
      volume_size           = 8
      volume_type           = "gp2"
      kms_key_id            = var.kms_key_id
    }
  }

  iam_instance_profile {
    arn = var.ccs_api_gateway_reverse_proxy_bastion_profile
  }

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [data.aws_security_group.ccs_inbound_ssh_security_group_name.id]
  }

  instance_market_options {
    market_type = "spot"
  }
}

resource "aws_launch_template" "ccs_api_gateway_reverse_proxy_2a_launch_template" {
  image_id      = data.aws_ami.reverse_proxy_ami.id
  instance_type = var.reverse_proxy_eu_west_2a_instance_type
  key_name      = var.ec2_key_pair_name
  name          = "${var.ccs_api_gateway_reverse_proxy_eu_west_2a_component_name}_launch_template"

  vpc_security_group_ids = [
    data.aws_security_group.ccs_inbound_ssh_security_group_name.id,
    data.aws_security_group.nlb_inbound_security_group_name.id
  ]

  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      delete_on_termination = "true"
      encrypted             = "true"
      volume_size           = 8
      volume_type           = "gp2"
      kms_key_id            = var.kms_key_id
    }
  }

  iam_instance_profile {
    arn = var.ccs_api_gateway_reverse_proxy_eu_west_2a_profile
  }

  instance_market_options {
    market_type = "spot"
  }

}

resource "aws_launch_template" "ccs_api_gateway_reverse_proxy_2b_launch_template" {
  image_id      = data.aws_ami.reverse_proxy_ami.id
  instance_type = var.reverse_proxy_eu_west_2b_instance_type
  key_name      = var.ec2_key_pair_name
  name          = "${var.ccs_api_gateway_reverse_proxy_eu_west_2b_component_name}_launch_template"

  vpc_security_group_ids = [
    data.aws_security_group.ccs_inbound_ssh_security_group_name.id,
    data.aws_security_group.nlb_inbound_security_group_name.id
  ]

  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      delete_on_termination = "true"
      encrypted             = "true"
      volume_size           = 8
      volume_type           = "gp2"
      kms_key_id            = var.kms_key_id
    }
  }

  iam_instance_profile {
    arn = var.ccs_api_gateway_reverse_proxy_eu_west_2b_profile
  }

  instance_market_options {
    market_type = "spot"
  }

}

resource "aws_launch_template" "ccs_api_gateway_reverse_proxy_2c_launch_template" {
  image_id      = data.aws_ami.reverse_proxy_ami.id
  instance_type = var.reverse_proxy_eu_west_2c_instance_type
  key_name      = var.ec2_key_pair_name
  name          = "${var.ccs_api_gateway_reverse_proxy_eu_west_2c_component_name}_launch_template"

  vpc_security_group_ids = [
    data.aws_security_group.ccs_inbound_ssh_security_group_name.id,
    data.aws_security_group.nlb_inbound_security_group_name.id
  ]

  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      delete_on_termination = "true"
      encrypted             = "true"
      volume_size           = 8
      volume_type           = "gp2"
      kms_key_id            = var.kms_key_id
    }
  }

  iam_instance_profile {
    arn = var.ccs_api_gateway_reverse_proxy_eu_west_2c_profile
  }

  instance_market_options {
    market_type = "spot"
  }

}
