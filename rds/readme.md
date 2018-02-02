# RDS Config

See the module documentation on the [terraform module registry AWS RDS Page](https://registry.terraform.io/modules/terraform-aws-modules/rds/aws/)

## Getting Started

Set `env=<env>`

Not preferable to hard-code but in a declarative world where no interpolation is offered (yet) for resources used by `terraform init` it is necessary

```bash
env=dev
terraform get -update=true
terraform init -backend-config=config/backend-${env}.conf
terraform plan -var-file=config/${env}.tfvars
terraform apply -var-file=config/${env}.tfvars
```
