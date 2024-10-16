terraform {
  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "5.63.1"
    }
  }
}

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region = var.aws_region
}


data "terraform_remote_state" "AWS_VPC_id" {
  backend = "remote"

  config = {
    organization = "EQIX_projectX"
    workspaces = {
      name = "VipinTestRepo"
    }
  }
}

data "terraform_remote_state" "AWS_Subnet_id" {
  backend = "remote"

  config = {
    organization = "EQIX_projectX"
    workspaces = {
      name = "VipinTestRepo"
    }
  }
}

data "terraform_remote_state" "AWS_VPG_id" {
  backend = "remote"

  config = {
    organization = "EQIX_projectX"
    workspaces = {
      name = "VipinTestRepo"
    }
  }
}

module "aws-components" {
   source                = "git::github.com/Eqix-ProjectX/terraform-equinix-virtualconnection-aws-components"
   aws_vpc_id = data.terraform_remote_state.AWS_VPC_id.outputs.AWS_VPC_id
   aws_subnet_id = data.terraform_remote_state.AWS_Subnet_id.outputs.AWS_Subnet_id
   aws_vpg_id           = data.terraform_remote_state.AWS_VPG_id.outputs.AWS_VPG_id
 
}