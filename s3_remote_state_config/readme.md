# Remote State Setup

Required Var - `<name>`

__NOTE__ - S3 bucket name must be _globally_ unique, so `<name>` should reflect that

```bash
$ terraform init

$ terraform plan -var 'name=<name>'

$ terraform apply -var 'name=<name>'
```

This will create the necessary backend components (S3 bucket and DynamoDB table) to effectively handle remote state storage
