# Terraform AWS Live Environment Management
This implementation is largely based off of [Terraforms Recommended Best Practices](https://www.terraform.io/docs/enterprise/guides/recommended-practices/index.html)

## Prerequisites

You only need [Terraform](https://www.terraform.io/downloads.html) and an AWS account to run the code

OSX install - `brew install terraform`

Windows install - `chocolatey install terraform`

#### AWS Creds
AWS Credentials can be handled various ways but running the code out of the box should be fairly trivial if you do AWS development and have access key info stored in env vars or on disk at `~/.aws/credentials`. More info on the AWS provider can be found [here](https://www.terraform.io/docs/providers/aws/)

## Graph generation

From within any workspace you can run the following to view the graph
```bash
$ brew install graphviz

$ terraform graph | dot -Tpng > graph.png
```

## Considerations
* This is a POC showing various ways to handle the repository structure and workspace layout
* These workspaces could be broken down into different repositories rather than the monolithic repository
* The terraform concept of workspaces could be used instead of maintaining environments via vars and backend config
* Local vars would be a good idea to implement
* Terraform does not have a resource for AWS Kinesis Data Analytics :(
