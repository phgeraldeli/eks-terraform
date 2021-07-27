variable "aws_region" {
    type        = string
    description = "Região utilizada"
}

variable "subnet_count" {
    type        = string
    description = "O número de subnets de cada tipo."
}

variable "accessing_computer_ip" {
 type = string
 description = "IP of the computer to be allowed to connect to EKS master and nodes."
}

variable "keypair-name" {
  type = string
  description = "Name of the keypair declared in AWS IAM, used to connect into your instances via SSH."
}

# variable "hosted_zone_id" {
#   type = string
#   description = "ID of the hosted Zone created in Route53 before Terraform deployment."
# }

# variable "hosted_zone_url" {
#   type = string
#   description = "URL of the hosted Zone created in Route53 before Terraform deployment."
# }

variable "cluster_version" {
  type = string
}