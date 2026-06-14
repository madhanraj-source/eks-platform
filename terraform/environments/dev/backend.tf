terraform {
  backend "s3" {
    bucket         = "eks-platform-tfstate-maddy-2026"
    key            = "dev/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}