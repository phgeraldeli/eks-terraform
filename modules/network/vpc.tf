# VPC
resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
     "Name" = "vpc-eks"
     "kubernetes.io/cluster/eks-cluster" = "shared"
  }
}

#Subnets

data "aws_availability_zones" "available" {}

resource "aws_subnet" "gateway" {
  count = "${var.subnet_count}"
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  cidr_block        = "10.0.1${count.index}.0/24"
  vpc_id            = "${aws_vpc.vpc.id}"
  tags = {
     "Name" = "gateway-eks"
  }
}

resource "aws_subnet" "application" {
  count = "${var.subnet_count}"
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  cidr_block        = "10.0.2${count.index}.0/24"
  vpc_id            = "${aws_vpc.vpc.id}"
  tags = {
     "Name" = "vpc_application"
     "kubernetes.io/cluster/vpc" = "shared"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags = {
    Name = "igw-eks"
  }
}


resource "aws_eip" "elastic_ip" {
  count = "${var.subnet_count}"
  vpc      = true
}

resource "aws_nat_gateway" "nat_gateway" {
  count = "${var.subnet_count}"
  allocation_id = "${aws_eip.elastic_ip.*.id[count.index]}"
  subnet_id = "${aws_subnet.gateway.*.id[count.index]}"
  tags = {
    Name = "nat_gateway"
  }
  depends_on = [aws_internet_gateway.igw]
}