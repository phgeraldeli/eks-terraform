#Security Group para as subnets da região 1a
resource "aws_security_group" "worker_group_mgmt_one" {
  name_prefix = "worker_group_mgmt_one"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "10.0.11.0/24",
      "10.0.21.0/24"
    ]
  }

  tags = {
    Environment = "dev"
    Owner = "chaos-testing"
  }
}

#Security Group para as subnets da região 1b
resource "aws_security_group" "worker_group_mgmt_two" {
  name_prefix = "worker_group_mgmt_two"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "10.0.21.0/24",
      "10.0.22.0/24"
    ]
  }

  tags = {
    Environment = "dev"
    Owner = "chaos-testing"
  }
}

#Security Group para todas as subnets
resource "aws_security_group" "all_worker_mgmt" {
  name_prefix = "all_worker_management"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "10.0.11.0/24",
      "10.0.21.0/24",
      "10.0.21.0/24",
      "10.0.22.0/24"
    ]
  }

  tags = {
    Environment = "dev"
    Owner = "chaos-testing"
  }
}