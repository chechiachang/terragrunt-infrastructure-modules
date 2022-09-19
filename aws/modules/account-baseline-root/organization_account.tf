resource "aws_organizations_account" "account" {
  for_each = var.child_accounts
  name     = each.key
  email    = each.value["email"]

  depends_on = [
    aws_organizations_organization.org
  ]
}
