terraform {
  required_providers {
    aws = ">= 3.4"
    local = ">= 1.4"
    random = ">= 3.0.0"
    kubernetes = ">= 1.4"
  }
}

provider "aws" {
 region  = "${var.aws_region}"
 profile = "default"
}