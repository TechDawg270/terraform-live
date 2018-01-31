# Remote State Setup

Required Var - `<name>`

```bash
$ terraform init

$ terraform plan -var 'name=<name>'

$ terraform apply -var 'name=<name>'
```

This will create the necessary backend components (S3 bucket and DynamoDB table) to effectively handle remote state storage
