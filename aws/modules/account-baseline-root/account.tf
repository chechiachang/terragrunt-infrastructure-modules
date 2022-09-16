module "iam_account" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-account"
  for_each = var.child_accounts

  account_alias = "${var.account_alias}-${each.key}"

  minimum_password_length = 37
  require_numbers         = true
}
