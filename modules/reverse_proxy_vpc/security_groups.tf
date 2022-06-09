resource "aws_security_group" "ccs_api_gateway_reverse_proxy_nlb_inbound" {
  name        = var.nlb_inbound_security_group_name
  description = "inbound traffc from nlb"
  vpc_id      = aws_vpc.ccs_api_gateway_reverse_proxy_vpc.id

  tags = {
    Name = "nlb-inbound"
  }

  ingress {
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = [var.nlb_inbound_security_group_cidr_block]
    description = "inbound http"
  }

  ingress {
    from_port   = 443
    protocol    = "tcp"
    to_port     = 443
    cidr_blocks = [var.nlb_inbound_security_group_cidr_block]
    description = "inbound https"
  }

  egress {
    description = "Outbound HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Outbound HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Any TCP within VPC"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["192.168.0.0/16"]
  }

  egress {
    description = "Any UDP within VPC"
    from_port   = 0
    to_port     = 65535
    protocol    = "udp"
    cidr_blocks = ["192.168.0.0/16"]
  }

}

resource "aws_security_group" "ccs_api_gateway_reverse_proxy_ccs_inbound_ssh" {
  name        = var.ccs_inbound_ssh_security_group_name
  description = "inbound ssh from ccs"
  vpc_id      = aws_vpc.ccs_api_gateway_reverse_proxy_vpc.id
  tags = {
    Name = "ccs-inbound-ssh"
  }

  ingress {
    from_port   = 22
    protocol    = "TCP"
    to_port     = 22
    cidr_blocks = [var.ccs_inbound_ssh_security_group_cidr_block]
    description = "ssh from inside subnet"
  }

  ingress {
    from_port   = 22
    protocol    = "TCP"
    to_port     = 22
    cidr_blocks = var.ccs_ip_ranges
    description = "inbound ssh from ccs"
  }

  ingress {
    from_port   = 22
    protocol    = "TCP"
    to_port     = 22
    cidr_blocks = var.ansible_tower_ip_ranges
    description = "ansible tower"
  }

  egress {
    description = "Outbound HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Outbound HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Any TCP within VPC"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["192.168.0.0/16"]
  }

  egress {
    description = "Any UDP within VPC"
    from_port   = 0
    to_port     = 65535
    protocol    = "udp"
    cidr_blocks = ["192.168.0.0/16"]
  }

}
