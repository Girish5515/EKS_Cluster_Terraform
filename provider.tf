terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
 # Adding Backend as S3 for Remote State Storage
  backend "s3" {
    bucket = "girish9600164635"
    key    = "vgs/terraform.tfstate"
    region = "us-east-1"   
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

locals {
  region = "us-east-1"
  name = "vgs_cluster"
  vpc_cidr = "10.123.0.0/16"
  azs      = ["ap-southeast-1a", "ap-southeast-1b"]
  public_subnets  = ["10.123.1.0/24", "10.123.2.0/24"]
  private_subnets = ["10.123.3.0/24", "10.123.4.0/24"]
  intra_subnets   = ["10.123.5.0/24", "10.123.6.0/24"]
  tags = {
    Example = local.name
  }
}


