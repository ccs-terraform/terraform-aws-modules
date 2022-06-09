data "aws_eip" "eip_allocation_id" {
  tags = {
    Name = var.eip_name
  }
}
