module "vpc" {
  source = "../../modules/vpc"

  project_name = var.project_name
  environment  = var.environment

  vpc_cidr = var.vpc_cidr

  public_subnet_a_cidr = var.public_subnet_a_cidr
  public_subnet_b_cidr = var.public_subnet_b_cidr

  private_subnet_a_cidr = var.private_subnet_a_cidr
  private_subnet_b_cidr = var.private_subnet_b_cidr

  az_a = var.az_a
  az_b = var.az_b
}

module "ecr" {
  source = "../../modules/ecr"

  project_name = var.project_name
  environment  = var.environment
}

module "eks" {
  source = "../../modules/eks"

  project_name = var.project_name
  environment  = var.environment

  private_subnet_ids = module.vpc.private_subnet_ids
}

module "nodegroup" {
  source = "../../modules/nodegroup"

  project_name = var.project_name
  environment  = var.environment

  cluster_name = module.eks.cluster_name

  private_subnet_ids = module.vpc.private_subnet_ids
}

module "alb_irsa" {
  source = "../../modules/alb_irsa"

  project_name    = var.project_name
  environment     = var.environment

  aws_account_id  = var.aws_account_id
  oidc_provider_id = var.oidc_provider_id
}