# AWS EC2 Instance Application

## Getting Started

Set `env=<env>`

```bash
env=dev
terraform get -update=true
terraform init -backend-config=config/backend-${env}.conf
terraform plan -var-file=config/${env}.tfvars
terraform apply -var-file=config/${env}.tfvars
```

## Road Map
* Implement application level (layer 7) load balancing using AWS ALB
* Hook up auto-scaling slack notification
