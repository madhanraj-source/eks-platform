data "terraform_remote_state" "infra" {
  backend = "s3"

  config = {
    bucket = "eks-demo-terraform-state"
    key    = "dev/infra/terraform.tfstate"
    region = "us-east-2"
  }
}