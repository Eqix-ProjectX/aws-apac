terraform {
  required_providers {

    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = var.aws_region
}


data "terraform_remote_state" "AWS_outputs" {
  backend = "remote"

  config = {
    organization = "EQIX_projectX"
    workspaces = {
      name = "network-builder-apac"
    }
  }
}

module "aws-components" {
  source        = "github.com/Eqix-ProjectX/terraform-equinix-virtualconnection-aws-components/"
  aws_vpc_id    = data.terraform_remote_state.AWS_outputs.outputs.AWS_VPC_id
  aws_subnet_id = data.terraform_remote_state.AWS_outputs.outputs.AWS_Subnet_id
  aws_vpg_id    = data.terraform_remote_state.AWS_outputs.outputs.AWS_VPG_id
}