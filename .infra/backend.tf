terraform {
  backend "s3" {
    region  = "us-east-1"
    bucket  = "terraform-cact"
    key     = "rulesengine.tfstate"
    encrypt = true
  }
}
