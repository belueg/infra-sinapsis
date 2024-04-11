terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    tls = {
      source = "hashicorp/tls"
    }
  }
}


provider "aws" {
  region  = "sa-east-1"
  profile = "975049998685_AdministratorAccess"
}

provider "tls" {
}