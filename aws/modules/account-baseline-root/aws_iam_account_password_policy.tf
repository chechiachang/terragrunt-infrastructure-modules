# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_account_password_policy

resource "aws_iam_account_password_policy" "strict" {
  allow_users_to_change_password = true
  minimum_password_length        = var.minimum_password_length
  hard_expiry                    = true
  max_password_age               = var.max_password_age
  require_lowercase_characters   = true
  require_numbers                = true
  require_uppercase_characters   = true
  require_symbols                = true
  password_reuse_prevention      = 0
}
