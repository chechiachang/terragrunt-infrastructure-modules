# https://github.com/terraform-aws-modules/terraform-aws-iam/blob/master/modules/iam-user/outputs.tf
output "keybase_password_pgp_message" {
  description = "Encrypted password"
  value = {
    for key, value in module.iam_user : key => value.keybase_password_pgp_message
  }
}

output "keybase_password_decrypt_command" {
  description = "Decrypt user password command"
  value = {
    for key, value in module.iam_user : key => value.keybase_password_decrypt_command
  }
}

output "iam_access_key_id" {
  description = "The access key ID"
  value       =  {
    for key, value in module.iam_user : key => value.iam_access_key_id
  }
}

output "keybase_secret_key_decrypt_command" {
  description = "Decrypt access secret key command"
  value       = {
     for key, value in module.iam_user : key => value.keybase_secret_key_decrypt_command
  }
}

output "keybase_secret_key_pgp_message" {
  description = "Encrypted access secret key"
  value       = {
     for key, value in module.iam_user : key => value.keybase_secret_key_pgp_message
  }
}
