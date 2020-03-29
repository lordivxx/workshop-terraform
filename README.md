# workshop-terraform
Terraform examples for my use.
```bash
terraform init && terraform validate && terraform apply -auto-approve
terraform destroy -auto-approve
aws s3 cp ./main.tf s3:///
aws s3 cp ./main.tf s3://my-aws-bucket-name/
aws s3 rm s3://my-aws-bucket-name/ --recursive
```
