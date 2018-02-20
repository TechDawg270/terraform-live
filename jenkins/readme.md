# Jenkins

## Getting Started

Set `env=<env>`

```bash
env=dev
terraform get -update=true
terraform init -backend-config=config/backend-${env}.conf
terraform plan -var-file=config/${env}.tfvars
terraform apply -var-file=config/${env}.tfvars
```

## Roadmap
* Figure out updating strategy (rolling or immutable)
* Store data in S3 if possible to make that easier and decouple the data from the instance?
* Look into api options to automate security and plugin setup to be able to create fully from scratch
