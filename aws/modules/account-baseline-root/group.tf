# https://github.com/terraform-aws-modules/terraform-aws-iam/tree/master/modules/iam-group-with-policies

module "iam_group_with_policies_full_access" {
  source = "terraform-aws-modules/iam/aws//modules/iam-group-with-policies"

  name = "full-access"

  group_users = toset([
    for key, user in var.users : key if contains(
      user.groups,
      "full-access"
    )
  ])

  attach_iam_self_management_policy = true

  custom_group_policy_arns = [
    "arn:aws:iam::aws:policy/AdministratorAccess",
  ]

  //custom_group_policies = [
  //  {
  //    name   = "AllowS3Listing"
  //    policy = data.aws_iam_policy_document.sample.json
  //  }
  //]
}

module "iam_group_with_policies_billing" {
  source = "terraform-aws-modules/iam/aws//modules/iam-group-with-policies"

  name = "billing"

  group_users = toset([
    for key, user in var.users : key if contains(
      user.groups,
      "billing"
    )
  ])

  attach_iam_self_management_policy = true

  custom_group_policy_arns = [
    "arn:aws:iam::aws:policy/AWSBillingConductorFullAccess",
  ]

  //custom_group_policies = [
  //  {
  //    name   = "AllowS3Listing"
  //    policy = data.aws_iam_policy_document.sample.json
  //  }
  //]
}
