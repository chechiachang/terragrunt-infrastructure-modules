# account

variable "child_accounts" {
  type = map(any)
}

# user

variable "users" {
  # https://www.terraform.io/language/expressions/type-constraints#experimental-optional-object-type-attributes
  # Must add variable object type
  type = map(object({
    groups               = set(string)
    pgp_key              = string
    create_login_profile = bool
    create_access_keys   = bool
  }))
}
