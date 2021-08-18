oci session authenticate  # create new profile instead of default
oci session refresh --profile clingxin
terraform init
terraform fmt
terraform validate
terraform apply
terraform show

oci session authenticate # in case of session no longer valid, renew

terraform output

terraform destroy