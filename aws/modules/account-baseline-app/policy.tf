# full-access
data "aws_iam_policy_document" "full_access" {
  statement {
    sid       = "fullAccess"
    actions   = ["*"]
    resources = ["*"]
    effect    = "Allow"
  }
}

module "iam_policy_full_access" {
  source = "terraform-aws-modules/iam/aws//modules/iam-policy"

  name        = "full_access"
  path        = "/"
  description = "The administrator permission"

  policy = data.aws_iam_policy_document.full_access.json
}
