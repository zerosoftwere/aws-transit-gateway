# AWS Transit Gateway

AWS Transit gateway to configure and connect three VPCs. It also provision
instances to test the connection.

## Requirement
- AWS Account
- AWS Access and Secret keys
- AWS CLI
- Terraform
- SSH keypair

## How to
- Login to AWS CLI (`aws auth`) and follow the prompt
- Initialize the project (`terraform init`)
- Provision the infrastructure (`terraform apply`)

## Don't forget to remove resources after testing
- Unprovision the resources (`terraform destroy`)