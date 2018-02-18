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

## Notes related to zero downtime blue/green deploys
[Source - Terraform Google thread Group](https://groups.google.com/forum/#!msg/terraform-tool/7Gdhv1OAc80/iNQ93riiLwAJ)

Some of those principles still apply but at the time of that writing Terraform did not have [Waiting for Capacity](https://www.terraform.io/docs/providers/aws/r/autoscaling_group.html#waiting-for-capacity)
* Both the [launch configuration and asg](./autoscaling.tf) need lifecycle hooks with create before destroy set to true
* The launch configuration uses the `name_prefix` attribute to allow Terraform to prevent collisions
* The asg interpolates the launch configuration name into its name, so launch configuration changes always force replacement of the asg (and not just an ASG update)
* The asg sets `wait_for_capacity_timeout` which means Terraform considers an instance ready when the ASG reports *HealthStatus: "Healthy"* and *LifecycleState: "InService"* and then continues processing

The behavior when the AWS AMI data source changes is:

1. New launch configuration is created with the new AMI ID
2. New asg is created with the fresh launch configuration
3. Terraform waits for the new asg's instances to spin up and attach to the ELB
4. Once all new instances are *InService* and *Healthy*, Terraform begins destroy of old ASG
5. Once old asg is destroyed, Terraform destroys old launch configuration

## Road Map
* Implement application level (layer 7) load balancing using AWS ALB
* Hook up auto-scaling slack notification
