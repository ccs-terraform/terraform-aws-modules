terraform {
  required_version = "~> 0.11"
}

provider "aws" {
  region = "eu-west-2"
}

terraform {
  required_providers {
    aws = {
      version = "3.73.0"

    }
  }
}
