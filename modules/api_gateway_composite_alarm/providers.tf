terraform {
  required_version = "~> 0.11"
}

provider "aws" {
  region = var.region
}

terraform {
  required_providers {
    aws = {
      version = "3.73.0"

    }
  }
}
