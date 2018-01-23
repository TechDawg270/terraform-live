# Terraform AWS Live Environment Management
This implementation is largely based off of [Terraforms Recommended Best Practices](https://www.terraform.io/docs/enterprise/guides/recommended-practices/index.html)

## Prerequisites

You need the following to run the code:

* [Terraform](https://www.terraform.io/downloads.html)

OSX install - `brew install terraform`

Windows install - `chocolatey install terraform`

* An AWS account. Credentials can be handled various ways but running the code out of the box should be fairly trivial if you do AWS development and have access key info stored in env vars or on disk at `~/.aws/credentials`. More info on the AWS provider can be found [here](https://www.terraform.io/docs/providers/aws/)

## Key Benefits to Terraform

* Declarative language. The master branch of the repo should be a 1:1 representation of the environment itself

* Multi-provider. You can plug and play various pieces from a large list of [providers](https://www.terraform.io/docs/providers/)

* Client-only architecture (no agents or servers involved)
