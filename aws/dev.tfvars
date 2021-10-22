####################
# Tags
####################
variable "project" {
  default = "python-serverless-api"
}

variable "owner" {
  default = "lanru2001@yahoo.com"
}


####################
# VPC
####################
variable vpc_cidr {
  default = "10.0.0.0/16"
}

variable public_subnets_cidr {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable private_subnets_cidr {
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable nat_cidr {
  default = ["10.0.5.0/24", "10.0.6.0/24"]
}

variable igw_cidr {
  default = "10.0.8.0/24"
}

variable azs {
  default = ["us-east-2a", "us-east-2b"]
}

####################
# lambda
####################
variable "lambda_runtime" {
  default = "python3.6"
}

variable "lambda_zip_path" {}

variable "lambda_function_name" {
  default = "HttpServer"
}

variable "lambda_handler" {
  default = "run_lambda.http_server"
}

####################
# API Gateway
####################
variable "region" {
  default = "us-east-2"
}

variable "account_id" {}
