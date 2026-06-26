output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "frontend_repository_url" {
  value = module.ecr.frontend_repository_url
}

output "backend_repository_url" {
  value = module.ecr.backend_repository_url
}

output "cluster_role_arn" {
  value = module.eks.cluster_role_arn
}

output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "node_role_arn" {
  value = module.nodegroup.node_role_arn
}

output "node_group_name" {
  value = module.nodegroup.node_group_name
}

output "alb_controller_role_arn" {
  value = module.alb_irsa.alb_controller_role_arn
}

output "oidc_issuer" {
  value = module.eks.oidc_issuer
}

output "oidc_provider_arn" {
  value = module.eks.oidc_provider_arn
}