  
output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "app_subnet_ids" {
  value = "${aws_subnet.application.*.id}"
}

output "gateway_subnet_ids" {
  value = "${aws_subnet.gateway.*.id}"
}

# output "database_subnet_ids" {
#   value = "${aws_subnet.database.*.id}"
# }