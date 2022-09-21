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

# password policy

variable "minimum_password_length" {
  type = number
  description = "The number of days that an user password is valid."
  default = 32
}

variable "max_password_age" {
  type = number
  description = "Minimum length to require for user passwords."
  default = 90
}
