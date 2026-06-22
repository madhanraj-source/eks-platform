data "terraform_remote_state" "infra" {
  backend = "s3"

  config = {
    bucket = "eks-platform-tfstate-maddy-2026"
    key    = "dev/terraform.tfstate"
    region = "us-east-2"
  }
}