terraform {
  required_version = "1.1.0"
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
