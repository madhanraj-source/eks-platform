resource "aws_iam_role" "alb_controller_role" {
  name = "${var.project_name}-${var.environment}-alb-controller-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Federated = "arn:aws:iam::${var.aws_account_id}:oidc-provider/oidc.eks.us-east-2.amazonaws.com/id/${var.oidc_provider_id}"
        }

        Action = "sts:AssumeRoleWithWebIdentity"

        Condition = {
          StringEquals = {
            "oidc.eks.us-east-2.amazonaws.com/id/${var.oidc_provider_id}:aud" = "sts.amazonaws.com"

            "oidc.eks.us-east-2.amazonaws.com/id/${var.oidc_provider_id}:sub" = "system:serviceaccount:kube-system:aws-load-balancer-controller"
          }
        }
      }
    ]
  })
}

resource "aws_iam_policy" "alb_controller_policy" {
  name = "${var.project_name}-${var.environment}-alb-controller-policy"

  policy = file("${path.module}/iam_policy.json")
}

resource "aws_iam_role_policy_attachment" "alb_controller" {
  role       = aws_iam_role.alb_controller_role.name
  policy_arn = aws_iam_policy.alb_controller_policy.arn
}