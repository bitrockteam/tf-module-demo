provider "aws" {
  version                 = "~> 2.53"
  region                  = var.aws_region
  profile                 = "victor-test"
  shared_credentials_file = "${var.home}.aws/credentials"
  allowed_account_ids     = ["${var.aws_account_id}"]
}

terraform {
  backend "s3" {
    key = "environments/development/terraform.tfstate"
    # ...
  }
}
