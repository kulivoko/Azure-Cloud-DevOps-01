# Azure Infrastructure Operations Project: Deploying a scalable IaaS web server in Azure

### Introduction
For this project, you will write a Packer template and a Terraform template to deploy a customizable, scalable web server in Azure.

### Getting Started
1. Clone this repository

2. Create your infrastructure as code

3. Update this README to reflect how someone would use your code.

### Dependencies
1. Create an [Azure Account](https://portal.azure.com) 
2. Install the [Azure command line interface](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest)
3. Install [Packer](https://www.packer.io/downloads)
4. Install [Terraform](https://www.terraform.io/downloads.html)

### Instructions
1.     Download the content of this Repository and store it at location of your preference
2.     You should have three files
2.1.   main.tf
2.1.1. The file "main.tf" is your main configuration file containing definition of resources to be created including the settings specifications
2.2.   variables.tf
2.2.2. This file contains refence for all used variables
2.3.   server.json
3.     Open the folder containing the files (main.tf, variables.tf, server.json)
4.     Open the file main.tf for editing and locate "# Create AAS", comment out everything below until the end of file, save & close
5.     Start terminal in the same path as folder containing the .json and .tf files
6.     In your terminal use this command: terraform plan -out solution.plan
7.     Once the command finished processing enter another command: terraform apply "solution.plan", this should outline 1 resource that will be created
8.     This has created a resource group, which is required for creation of packer vm template as defined in our .json file
9.     Now we will create the packer template, from the terminal initiate command: packer build server.json
10.    Once completed locate line "ManagedImageId", it will be the second line from bottom, copy the entire output, which should look similar like this:
/subscriptions/<your subscription id>/resourceGroups/<your resource group name>-rg/providers/Microsoft.Compute/images/myPackerImage
11.    Edit the variables.tf, locate variable with name "packerimage" and paste the entire value of "ManagedImageId", save & close
12.    Open the file main.tf for editing and locate "# Create AAS", uncomment everything below until the end of file, basically revert the task from step 4. of this procedure, save & close
13.    Get back to your terminal and use this command: terraform plan -out solution.plan
14.    Once the command finished processing enter another command: terraform apply "solution.plan", this should outline 19 resources that will be created
15.    If you see following output: Apply complete! Resources: 19 added, 0 changed, 0 destroyed. Then you have successfuly created infrastructure as defined in this procedure
16.    Now it is time to clean-up, open termin in the same path as folder containing the .json and .tf files
17.    Initiate command: terraform destroy
18.    You will presented with the the plan to destroy 20 resources and you will be asked for confirmation, type yes and press enter
19.    Once the command has finished you should see: Destroy complete! Resources: 20 destroyed.
20.    That is the end of this practice


### Output
**Your words here**

