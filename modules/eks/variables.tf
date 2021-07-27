variable "vpc_id" {
  type = string
}

variable "accessing_computer_ip" {
    type = string
    description = "Public IP of the computer accessing the cluster via kubectl or browser."
}

variable "aws_region" {
  type = string
}

variable "keypair-name" {
  type = string
}

variable "app_subnet_ids" {
  type = list
}

variable "cluster_version" {
  type = string
}