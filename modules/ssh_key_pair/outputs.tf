output "keypair_name" {
  value = aws_key_pair.terraform_aws_key.key_name
}

output "keypair_path" {
  value = local_sensitive_file.terraform_local_key.filename
}
