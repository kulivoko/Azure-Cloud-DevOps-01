# Azure Infrastructure Operations Project: Deploying a scalable IaaS web server in Azure

### Introduction
For this project, you will write a Packer template and a Terraform template to deploy a customizable, scalable web server in Azure.

### Getting Started
1. Download the three files main.tf, variables.tf and server.json from this repository

2. Store the files in a folder of your preference

3. Follow instructions to create the infrastructure using terraform and packer

### Dependencies
1. Create an [Azure Account](https://portal.azure.com) 
2. Install the [Azure command line interface](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest)
3. Install [Packer](https://www.packer.io/downloads)
4. Install [Terraform](https://www.terraform.io/downloads.html)

### Customisations
## Variables


### Instructions

1. Open the terminal and initiate this command: az login
2. The file "main.tf" is your main configuration file containing definition of resources to be created including the settings specifications
3. The file "variables.tf" contains refence for all used variables
4. Open the folder containing the files (main.tf, variables.tf, server.json)
5. Open the file main.tf for editing and locate "# Create AAS", comment out everything below until the end of file, save & close
6. Start terminal in the same path as folder containing the .json and .tf files
7. In your terminal use this command: terraform plan -out solution.plan
8. Once the command finished processing enter another command: terraform apply "solution.plan", this should outline 1 resource that will be created
9. This has created a resource group, which is required for creation of packer vm template as defined in our .json file
10. Now we will create the packer template, from the terminal initiate command: packer build server.json
11. Once completed locate line "ManagedImageId", it will be the second line from bottom, copy the entire output, which should look similar like this: /subscriptions/<your subscription id>/resourceGroups/<your resource group name>-rg/providers/Microsoft.Compute/images/myPackerImage
12. Edit the variables.tf, locate variable with name "packerimage" and paste the entire value of "ManagedImageId", save & close
13. Open the file main.tf for editing and locate "# Create AAS", uncomment everything below until the end of file, basically revert the task from step 4. of this procedure, save & close
14. Get back to your terminal and use this command: terraform plan -out solution.plan
15. Once the command finished processing enter another command: terraform apply "solution.plan", this should outline 19 resources that will be created
16. If you see following output: Apply complete! Resources: 19 added, 0 changed, 0 destroyed. Then you have successfuly created infrastructure as defined in this procedure
17. Now it is time to clean-up, open termin in the same path as folder containing the .json and .tf files
18. Initiate command: terraform destroy
19. You will presented with the the plan to destroy 20 resources and you will be asked for confirmation, type yes and press enter
20. Once the command has finished you should see: Destroy complete! Resources: 20 destroyed.
21. That is the end of this practice


### Output
**Your words here**

