# tf-demo - show how to work with workspaces on TF using Makefile

Prerequisite
-Already have installed and configured your AWS CLI.
  Ref:
 
	Linux : https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html

	Mac : https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-mac.html

- S3 bucket as backend
   Linux or macOS
	$ export AWS_PROFILE=my_profile

	Create the bucket with AWS CLI:

	aws s3 mb s3://tf-statefiles-${TF_RG} --region ${TF_RG} --profile my-profile

	Enable versioning:

	aws s3api put-bucket-versioning --bucket tf-statefiles-${TF_RG} --versioning-configuration Status=Enabled

This repo defines 3 different environments and will create 20 (aws resources) on each one.
To simplify the demo, all these resources are created from this module :     

 terraform-aws-modules/vpc/aws

 This module will create the VPC, subnets, route tables , igw. also is created a S3 bucket for each env...


Update backend.tf and replace your bucket name = "tf-statefiles-your-region", your region , your key and your profile.

You are ready to go, you could run Makefile.

$ENV=workspaces make init 

$ENV=development make plan

$ENV=develpment make apply

To cleanup 

$ENV=development make destroy


tf-demo/

├── environments

│   ├── backend.tf

│   ├── env_vars

│   │   ├── development.tfvars

│   │   ├── production.tfvars

│   │   └── testing.tfvars

│   ├── Makefile

│   ├── providers.tf

│   ├── s3.tf

│   ├── variables.tf

│   └── vpc.tf

└── README.md


# tf-module-demo
# tf-module-demo
# tf-module-demo
