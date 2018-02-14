# AWS EMR Config

[Implementation based on this blog post](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/EMRforDynamoDB.html#EMRforDynamoDB.Overview)

## Getting Started

### Setup environment and infrastructure
Set `env=<env>`

```bash
env=dev
terraform get -update=true
terraform init -backend-config=config/backend-${env}.conf
terraform plan -var-file=config/${env}.tfvars
terraform apply -var-file=config/${env}.tfvars
```

## Process
