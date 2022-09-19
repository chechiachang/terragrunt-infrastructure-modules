# https://github.com/terraform-aws-modules/terraform-aws-iam/tree/master/modules/iam-user

module "iam_user" {
  source   = "terraform-aws-modules/iam/aws//modules/iam-user"
  for_each = var.users

  name          = each.key
  force_destroy = true

  create_iam_user_login_profile = each.value.create_login_profile
  create_iam_access_key         = each.value.create_access_keys
  pgp_key                       = each.value.pgp_key
  password_reset_required       = false
}
