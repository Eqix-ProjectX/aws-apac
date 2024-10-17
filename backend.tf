terraform {
  cloud {

    organization = "EQIX_projectX"

    workspaces {
      name = "aws-apac"
    }
  }
}