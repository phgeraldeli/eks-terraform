resource "aws_route_table" "application" {
  count = "${var.subnet_count}"
  vpc_id = "${aws_vpc.vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.nat_gateway.*.id[count.index]}"
  }
  tags = {
    Name = "eks-chaostesting-application"
  }
}

resource "aws_route_table" "database" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags = {
    Name = "route-table database"
  }
}

resource "aws_route_table" "gateway" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }
  tags = {
    Name = "internet_gateway_route_table"
  }
}

resource "aws_route_table_association" "application" {
  count = "${var.subnet_count}"

  subnet_id      = "${aws_subnet.application.*.id[count.index]}"
  route_table_id = "${aws_route_table.application.*.id[count.index]}"
}

resource "aws_route_table_association" "database" {
  count = "${var.subnet_count}"

  subnet_id      = "${aws_subnet.database.*.id[count.index]}"
  route_table_id = "${aws_route_table.database.id}"
}

resource "aws_route_table_association" "gateway" {
  count = "${var.subnet_count}"

  subnet_id      = "${aws_subnet.gateway.*.id[count.index]}"
  route_table_id = "${aws_route_table.gateway.id}"
}