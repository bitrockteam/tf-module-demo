TERRAFORM_VERSION="0.12.25"
TF_VERSION=`terraform -v | head -1 | awk -F "v" '{print $2}'`
	
default:

	@echo "Creates a TF system from a template."
	@echo "The following commands are available:"
	@echo " -init 		: runs TF init for an environment"
	@echo " -plan 		: runs TF plan for an environment"
	@echo " -apply		: runs TF apply for an environment"
	@echo " -destroy	: will delete the entire project's infrastructure"

check:
	@echo ""
	@echo "checking TF version... expecting [${TERRAFORM_VERSION}, found ${TF_VERSION}]"
 
init: check
	@echo ""
	@echo "Starting the creation of workspaces defined as $(value ENV)"
	@echo ""
	@read -p "Press enter to continue"

	@echo "Initializing the s3 backend..."
	(cd environment/$(value ENV); terraform init -backend=true -backend-config=backend.config -force-copy) 

	@echo "Creating the backend workspaces by environment/directory"
	(cd environment/$(value ENV); terraform workspace new $(value ENV))

	@echo "Backends initialized"

plan: check
	(cd environment/$(value ENV) ; terraform fmt -write=false -recursive)

	@echo "Terraform download the required modules in your project .terraform folder"
	(cd environment/$(value ENV) ; terraform get)	

	@echo "Switch to the [$(value ENV)] environment."
	(cd environment/$(value ENV) ; terraform workspace select $(value ENV))

	(cd environment/$(value ENV) ;terraform plan -var-file=$(value ENV).tfvars -var="aws_prefix=$(value ENV)" -out $(value ENV).plan) 
		
apply: check
	@echo "Swtiching to the [$(value ENV)] environment ..."
	(cd environment/$(value ENV) ; terraform workspace select $(value ENV))
	
	@echo "Will be applying the following to [$(value ENV)] environment:"
	(cd environment/$(value ENV) ; terraform show $(value ENV).plan)

	(cd environment/$(value ENV) ; terraform apply $(value ENV).plan ; rm $(value ENV).plan)

destroy: check
	@echo "Switching to the [$(value ENV)] environment ..."
	(cd environment/$(value ENV); terraform workspace select $(value ENV))
	@echo "Are you really sure you want to completely destroy [$(value ENV)] environment ?"
	@read -p "Press enter to continue"

	(cd environment/$(value ENV); terraform destroy -var-file=$(value ENV).tfvars)
        
	@echo "Deleting the backend workspaces...[$(value ENV)]"
	(cd environment/$(value ENV) ; terraform workspace select default ; terraform workspace delete $(value ENV) )
