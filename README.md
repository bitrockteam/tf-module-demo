# tf-demo - PART II - show how to work with modules and workspaces on TF with Makefile

Here we define separated environments with independ remote s3 backend.

This show of to automate this method using Makefile to deploy the backend, workspaces by environment.


for more details about pre-requisite , pls, check the PART I : https://github.com/bitrockteam/tf-demo-ws


tf-module-demo/

├── environment

│   ├── development

│   │   ├── backend.config

│   │   ├── development.tfvars

│   │   ├── main.tf

│   │   ├── outputs.tf

│   │   └── variables.tf

│   ├── production

│   │   ├── backend.config

│   │   ├── main.tf

│   │   ├── outputs.tf

│   │   ├── production.tfvars

│   │   └── variables.tf

│   └── testing

│       ├── main.tf

│       ├── testing.tfvars

│       └── variables.tf

├── Makefile

├── modules

│   └── common

├── README.md


