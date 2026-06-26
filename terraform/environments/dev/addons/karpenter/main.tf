data "aws_iam_policy_document" "karpenter_assume_role" {
  statement {
    effect = "Allow"

    actions = [
      "sts:AssumeRoleWithWebIdentity"
    ]

    principals {
      type = "Federated"
      identifiers = [
        data.terraform_remote_state.infra.outputs.oidc_provider_arn
      ]
    }

    condition {
      test     = "StringEquals"
      variable = "${replace(data.terraform_remote_state.infra.outputs.oidc_provider, "https://", "")}:sub"

      values = [
        "system:serviceaccount:kube-system:karpenter"
      ]
    }
  }
}

resource "aws_iam_role" "karpenter_controller" {
  name = "${data.terraform_remote_state.infra.outputs.cluster_name}-karpenter-controller-role"

  assume_role_policy = data.aws_iam_policy_document.karpenter_assume_role.json
}