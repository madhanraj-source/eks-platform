resource "helm_release" "alb_controller" {
  name       = "aws-load-balancer-controller"

  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"

  namespace = "kube-system"

  values = [
    yamlencode({
      clusterName = data.terraform_remote_state.infra.outputs.cluster_name

      region = "us-east-2"

      vpcId = data.terraform_remote_state.infra.outputs.vpc_id

      serviceAccount = {
        create = true

        name = "aws-load-balancer-controller"

        annotations = {
          "eks.amazonaws.com/role-arn" = data.terraform_remote_state.infra.outputs.alb_controller_role_arn
        }
      }
    })
  ]
}