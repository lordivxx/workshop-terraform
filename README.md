# workshop-terraform
Terraform examples for my use.
```bash
## Terraform Control
terraform init && terraform validate && terraform apply -auto-approve
terraform destroy -auto-approve

## AWS S3 commands
aws s3 cp ./main.tf s3://my-aws-bucket-name/
aws s3 rm s3://my-aws-bucket-name/ --recursive
```
