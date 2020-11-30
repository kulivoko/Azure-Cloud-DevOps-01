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

### Customizations
#### Main.tf
The file "main.tf" is your main configuration file containing definition of resources to be created including the settings and detailed specifications of each infrastructure element.

You can customize this file according to your needs. However, now it is configured to pass the project assignment.

#### Variables.tf
The variables.tf file contains refences for all used variables. Any of the given variables, like rg(resource group) or vm_instances(number of virtual machine instances) can be updated and customized. I recommend changing following:

1. prefix         - The prefix used for all resource names where this variable is  applied
2. location       - The Azure Region in which all resources with this variable will be created
3. rg             - A Preferred name of resource group
4. admin_username - The administrator's user name for virtual machine
5. admin_password - The administrator's password that must meet Azure complexity requirements
6. packerimage    - The packer image created in Azure (update accordingly as defined under step 11 in the Instructions section)

There are other variables:

1. vm_size        - The size of the VM
2. vm_instances   - The number of instances of VM's
3. addressprefix  - Range of ip addresses for virtual network
4. subnetprefix   - Range of ip addresses for subnet

#### Server.json
This is a packer template. It contains configuration for creation of vm image. I suggest to edit following keys:

1. subscription_id - Update with your subscription id
2. managed_image_resource_group_name - update with resource group used in variables.tf, rg variable value

### Instructions

1. Open the terminal and initiate this command: az login
2. The file "main.tf" is your main configuration file containing definition of resources to be created including the settings specifications
3. Open the folder containing the files (main.tf, variables.tf, server.json)
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
#### Policy Ouput
kulivoko@kuli:~/Documents/Udacity/Deploying resources using Terraform$ az policy assignment list
[
  {
    "description": "",
    "displayName": "tagging-policy",
    "enforcementMode": "Default",
    "id": "/subscriptions/9c790a0a-ea54-4253-900b-4e1b6af9f5d2/providers/Microsoft.Authorization/policyAssignments/eb42115493f14547b4140269",
    "identity": null,
    "location": null,
    "metadata": {
      "assignedBy": "Michal Bruštík",
      "createdBy": "1457035e-b6bd-4b7f-9a83-3de64cd2e321",
      "createdOn": "2020-11-23T18:34:50.2559997Z",
      "parameterScopes": {},
      "updatedBy": "1457035e-b6bd-4b7f-9a83-3de64cd2e321",
      "updatedOn": "2020-11-23T18:52:16.3710866Z"
    },
    "name": "eb42115493f14547b4140269",
    "notScopes": [],
    "parameters": {
      "tagName": {
        "value": "webserver-env"
      }
    },
    "policyDefinitionId": "/subscriptions/9c790a0a-ea54-4253-900b-4e1b6af9f5d2/providers/Microsoft.Authorization/policyDefinitions/73836486-e0e3-4796-ba34-e81854209b4a",
    "scope": "/subscriptions/9c790a0a-ea54-4253-900b-4e1b6af9f5d2",
    "sku": {
      "name": "A0",
      "tier": "Free"
    },
    "type": "Microsoft.Authorization/policyAssignments"
  },
  {
    "description": "This is the default set of policies monitored by Azure Security Center. It was automatically assigned as part of onboarding to Security Center. The default assignment contains only audit policies. For more information please visit https://aka.ms/ascpolicies",
    "displayName": "ASC Default (subscription: 9c790a0a-ea54-4253-900b-4e1b6af9f5d2)",
    "enforcementMode": "Default",
    "id": "/subscriptions/9c790a0a-ea54-4253-900b-4e1b6af9f5d2/providers/Microsoft.Authorization/policyAssignments/SecurityCenterBuiltIn",
    "identity": null,
    "location": null,
    "metadata": {
      "assignedBy": "Security Center",
      "createdBy": "0e111762-b8a3-475e-ba3c-80a6879b52a1",
      "createdOn": "2020-11-06T06:49:54.024058Z",
      "updatedBy": null,
      "updatedOn": null
    },
    "name": "SecurityCenterBuiltIn",
    "notScopes": null,
    "parameters": {},
    "policyDefinitionId": "/providers/Microsoft.Authorization/policySetDefinitions/1f3afdf9-d0c9-4c3d-847f-89da613e70a8",
    "scope": "/subscriptions/9c790a0a-ea54-4253-900b-4e1b6af9f5d2",
    "sku": {
      "name": "A1",
      "tier": "Standard"
    },
    "type": "Microsoft.Authorization/policyAssignments"
  }
]

#### Output of the terraform and packer

kulivoko@kuli:~/Documents/Udacity/Deploying resources using Terraform$ terraform plan -out solution.plan
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

azurerm_availability_set.main: Refreshing state... [id=/subscriptions/9c790a0a-ea54-4253-900b-4e1b6af9f5d2/resourceGroups/udacity-rg/providers/Microsoft.Compute/availabilitySets/udacity-aset]
azurerm_public_ip.main: Refreshing state... [id=/subscriptions/9c790a0a-ea54-4253-900b-4e1b6af9f5d2/resourceGroups/udacity-rg/providers/Microsoft.Network/publicIPAddresses/udacity-vm-ip-01]
azurerm_subnet.main: Refreshing state... [id=/subscriptions/9c790a0a-ea54-4253-900b-4e1b6af9f5d2/resourceGroups/udacity-rg/providers/Microsoft.Network/virtualNetworks/udacity-network/subnets/udacity-subnet]
azurerm_network_interface.main[0]: Refreshing state... [id=/subscriptions/9c790a0a-ea54-4253-900b-4e1b6af9f5d2/resourceGroups/udacity-rg/providers/Microsoft.Network/networkInterfaces/udacity-nic]
azurerm_virtual_network.main: Refreshing state... [id=/subscriptions/9c790a0a-ea54-4253-900b-4e1b6af9f5d2/resourceGroups/udacity-rg/providers/Microsoft.Network/virtualNetworks/udacity-network]
azurerm_linux_virtual_machine.main[2]: Refreshing state... [id=/subscriptions/9c790a0a-ea54-4253-900b-4e1b6af9f5d2/resourceGroups/udacity-rg/providers/Microsoft.Compute/virtualMachines/udacity-vm-2]

------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # azurerm_resource_group.main will be created
  + resource "azurerm_resource_group" "main" {
      + id       = (known after apply)
      + location = "eastus"
      + name     = "udacity-rg"
      + tags     = {
          + "webserver-env" = "udacityProject"
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

This plan was saved to: solution.plan

To perform exactly these actions, run the following command to apply:
    terraform apply "solution.plan"

kulivoko@kuli:~/Documents/Udacity/Deploying resources using Terraform$ terraform apply "solution.plan"
azurerm_resource_group.main: Creating...
azurerm_resource_group.main: Creation complete after 1s [id=/subscriptions/9c790a0a-ea54-4253-900b-4e1b6af9f5d2/resourceGroups/udacity-rg]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

The state of your infrastructure has been saved to the path
below. This state is required to modify and destroy your
infrastructure, so keep it safe. To inspect the complete state
use the `terraform show` command.

State path: terraform.tfstate
kulivoko@kuli:~/Documents/Udacity/Deploying resources using Terraform$ terraform show
# azurerm_resource_group.main:
resource "azurerm_resource_group" "main" {
    id       = "/subscriptions/9c790a0a-ea54-4253-900b-4e1b6af9f5d2/resourceGroups/udacity-rg"
    location = "eastus"
    name     = "udacity-rg"
    tags     = {
        "webserver-env" = "udacityProject"
    }
}
kulivoko@kuli:~/Documents/Udacity/Deploying resources using Terraform$ packer build server.json
azure-arm: output will be in this color.

==> azure-arm: Running builder ...
==> azure-arm: Getting tokens using device flow
==> azure-arm: Getting token for https://management.azure.com/
==> azure-arm: Loading auth token from file: /home/kulivoko/.azure/packer/oauth-755075d1-9333-47a2-80db-119a71545decmgmt.json
==> azure-arm: Auth token found in file: /home/kulivoko/.azure/packer/oauth-755075d1-9333-47a2-80db-119a71545decmgmt.json
==> azure-arm: Getting tokens using device flow
==> azure-arm: Getting token for Vault resource
==> azure-arm: Loading auth token from file: /home/kulivoko/.azure/packer/oauth-755075d1-9333-47a2-80db-119a71545decvault.json
==> azure-arm: Auth token found in file: /home/kulivoko/.azure/packer/oauth-755075d1-9333-47a2-80db-119a71545decvault.json
    azure-arm: Creating Azure Resource Manager (ARM) client ...
==> azure-arm: WARNING: Zone resiliency may not be supported in East US, checkout the docs at https://docs.microsoft.com/en-us/azure/availability-zones/
==> azure-arm: Creating resource group ...
==> azure-arm:  -> ResourceGroupName : 'pkr-Resource-Group-r7f31o49om'
==> azure-arm:  -> Location          : 'East US'
==> azure-arm:  -> Tags              :
==> azure-arm:  ->> webserver-env : udacityProject
==> azure-arm: Validating deployment template ...
==> azure-arm:  -> ResourceGroupName : 'pkr-Resource-Group-r7f31o49om'
==> azure-arm:  -> DeploymentName    : 'pkrdpr7f31o49om'
==> azure-arm: Deploying deployment template ...
==> azure-arm:  -> ResourceGroupName : 'pkr-Resource-Group-r7f31o49om'
==> azure-arm:  -> DeploymentName    : 'pkrdpr7f31o49om'
==> azure-arm:
==> azure-arm: Getting the VM's IP address ...
==> azure-arm:  -> ResourceGroupName   : 'pkr-Resource-Group-r7f31o49om'
==> azure-arm:  -> PublicIPAddressName : 'pkripr7f31o49om'
==> azure-arm:  -> NicName             : 'pkrnir7f31o49om'
==> azure-arm:  -> Network Connection  : 'PublicEndpoint'
==> azure-arm:  -> IP Address          : '13.92.214.79'
==> azure-arm: Waiting for SSH to become available...
==> azure-arm: Connected to SSH!
==> azure-arm: Provisioning with shell script: /tmp/packer-shell149536215
==> azure-arm: + echo Hello, World!
==> azure-arm: Querying the machine's properties ...
==> azure-arm:  -> ResourceGroupName : 'pkr-Resource-Group-r7f31o49om'
==> azure-arm:  -> ComputeName       : 'pkrvmr7f31o49om'
==> azure-arm:  -> Managed OS Disk   : '/subscriptions/9c790a0a-ea54-4253-900b-4e1b6af9f5d2/resourceGroups/pkr-Resource-Group-r7f31o49om/providers/Microsoft.Compute/disks/pkrosr7f31o49om'
==> azure-arm: Querying the machine's additional disks properties ...
==> azure-arm:  -> ResourceGroupName : 'pkr-Resource-Group-r7f31o49om'
==> azure-arm:  -> ComputeName       : 'pkrvmr7f31o49om'
==> azure-arm: Powering off machine ...
==> azure-arm:  -> ResourceGroupName : 'pkr-Resource-Group-r7f31o49om'
==> azure-arm:  -> ComputeName       : 'pkrvmr7f31o49om'
==> azure-arm: Capturing image ...
==> azure-arm:  -> Compute ResourceGroupName : 'pkr-Resource-Group-r7f31o49om'
==> azure-arm:  -> Compute Name              : 'pkrvmr7f31o49om'
==> azure-arm:  -> Compute Location          : 'East US'
==> azure-arm:  -> Image ResourceGroupName   : 'udacity-rg'
==> azure-arm:  -> Image Name                : 'myPackerImage'
==> azure-arm:  -> Image Location            : 'East US'
==> azure-arm: Removing the created Deployment object: 'pkrdpr7f31o49om'
==> azure-arm: 
==> azure-arm: Cleanup requested, deleting resource group ...
==> azure-arm: Resource group has been deleted.
Build 'azure-arm' finished after 8 minutes 53 seconds.

==> Wait completed after 8 minutes 53 seconds

==> Builds finished. The artifacts of successful builds are:
--> azure-arm: Azure.ResourceManagement.VMImage:

OSType: Linux
ManagedImageResourceGroupName: udacity-rg
ManagedImageName: myPackerImage
ManagedImageId: /subscriptions/9c790a0a-ea54-4253-900b-4e1b6af9f5d2/resourceGroups/udacity-rg/providers/Microsoft.Compute/images/myPackerImage
ManagedImageLocation: East US

kulivoko@kuli:~/Documents/Udacity/Deploying resources using Terraform$ terraform plan -out solution.plan
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

azurerm_resource_group.main: Refreshing state... [id=/subscriptions/9c790a0a-ea54-4253-900b-4e1b6af9f5d2/resourceGroups/udacity-rg]

------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # azurerm_availability_set.main will be created
  + resource "azurerm_availability_set" "main" {
      + id                           = (known after apply)
      + location                     = "eastus"
      + managed                      = true
      + name                         = "udacity-aset"
      + platform_fault_domain_count  = 3
      + platform_update_domain_count = 5
      + resource_group_name          = "udacity-rg"
      + tags                         = {
          + "webserver-env" = "udacityProject"
        }
    }

  # azurerm_lb.main will be created
  + resource "azurerm_lb" "main" {
      + id                   = (known after apply)
      + location             = "eastus"
      + name                 = "udacity-lb"
      + private_ip_address   = (known after apply)
      + private_ip_addresses = (known after apply)
      + resource_group_name  = "udacity-rg"
      + sku                  = "Basic"
      + tags                 = {
          + "webserver-env" = "udacityProject"
        }

      + frontend_ip_configuration {
          + id                            = (known after apply)
          + inbound_nat_rules             = (known after apply)
          + load_balancer_rules           = (known after apply)
          + name                          = "PublicIPAddress"
          + outbound_rules                = (known after apply)
          + private_ip_address            = (known after apply)
          + private_ip_address_allocation = (known after apply)
          + private_ip_address_version    = "IPv4"
          + public_ip_address_id          = (known after apply)
          + public_ip_prefix_id           = (known after apply)
          + subnet_id                     = (known after apply)
        }
    }

  # azurerm_lb_backend_address_pool.main will be created
  + resource "azurerm_lb_backend_address_pool" "main" {
      + backend_ip_configurations = (known after apply)
      + id                        = (known after apply)
      + load_balancing_rules      = (known after apply)
      + loadbalancer_id           = (known after apply)
      + name                      = "BackEndAddressPool"
      + resource_group_name       = "udacity-rg"
    }

  # azurerm_linux_virtual_machine.main[0] will be created
  + resource "azurerm_linux_virtual_machine" "main" {
      + admin_password                  = (sensitive value)
      + admin_username                  = "azureadmin"
      + allow_extension_operations      = true
      + availability_set_id             = (known after apply)
      + computer_name                   = (known after apply)
      + disable_password_authentication = false
      + extensions_time_budget          = "PT1H30M"
      + id                              = (known after apply)
      + location                        = "eastus"
      + max_bid_price                   = -1
      + name                            = "udacity-vm-0"
      + network_interface_ids           = (known after apply)
      + priority                        = "Regular"
      + private_ip_address              = (known after apply)
      + private_ip_addresses            = (known after apply)
      + provision_vm_agent              = true
      + public_ip_address               = (known after apply)
      + public_ip_addresses             = (known after apply)
      + resource_group_name             = "udacity-rg"
      + size                            = "Standard_B1ls"
      + source_image_id                 = "/subscriptions/9c790a0a-ea54-4253-900b-4e1b6af9f5d2/resourceGroups/udacity-rg/providers/Microsoft.Compute/images/myPackerImage"
      + tags                            = {
          + "webserver-env" = "udacityProject"
        }
      + virtual_machine_id              = (known after apply)
      + zone                            = (known after apply)

      + os_disk {
          + caching                   = "ReadWrite"
          + disk_size_gb              = (known after apply)
          + name                      = "myosdisk0"
          + storage_account_type      = "Standard_LRS"
          + write_accelerator_enabled = false
        }
    }

  # azurerm_linux_virtual_machine.main[1] will be created
  + resource "azurerm_linux_virtual_machine" "main" {
      + admin_password                  = (sensitive value)
      + admin_username                  = "azureadmin"
      + allow_extension_operations      = true
      + availability_set_id             = (known after apply)
      + computer_name                   = (known after apply)
      + disable_password_authentication = false
      + extensions_time_budget          = "PT1H30M"
      + id                              = (known after apply)
      + location                        = "eastus"
      + max_bid_price                   = -1
      + name                            = "udacity-vm-1"
      + network_interface_ids           = (known after apply)
      + priority                        = "Regular"
      + private_ip_address              = (known after apply)
      + private_ip_addresses            = (known after apply)
      + provision_vm_agent              = true
      + public_ip_address               = (known after apply)
      + public_ip_addresses             = (known after apply)
      + resource_group_name             = "udacity-rg"
      + size                            = "Standard_B1ls"
      + source_image_id                 = "/subscriptions/9c790a0a-ea54-4253-900b-4e1b6af9f5d2/resourceGroups/udacity-rg/providers/Microsoft.Compute/images/myPackerImage"
      + tags                            = {
          + "webserver-env" = "udacityProject"
        }
      + virtual_machine_id              = (known after apply)
      + zone                            = (known after apply)

      + os_disk {
          + caching                   = "ReadWrite"
          + disk_size_gb              = (known after apply)
          + name                      = "myosdisk1"
          + storage_account_type      = "Standard_LRS"
          + write_accelerator_enabled = false
        }
    }

  # azurerm_linux_virtual_machine.main[2] will be created
  + resource "azurerm_linux_virtual_machine" "main" {
      + admin_password                  = (sensitive value)
      + admin_username                  = "azureadmin"
      + allow_extension_operations      = true
      + availability_set_id             = (known after apply)
      + computer_name                   = (known after apply)
      + disable_password_authentication = false
      + extensions_time_budget          = "PT1H30M"
      + id                              = (known after apply)
      + location                        = "eastus"
      + max_bid_price                   = -1
      + name                            = "udacity-vm-2"
      + network_interface_ids           = (known after apply)
      + priority                        = "Regular"
      + private_ip_address              = (known after apply)
      + private_ip_addresses            = (known after apply)
      + provision_vm_agent              = true
      + public_ip_address               = (known after apply)
      + public_ip_addresses             = (known after apply)
      + resource_group_name             = "udacity-rg"
      + size                            = "Standard_B1ls"
      + source_image_id                 = "/subscriptions/9c790a0a-ea54-4253-900b-4e1b6af9f5d2/resourceGroups/udacity-rg/providers/Microsoft.Compute/images/myPackerImage"
      + tags                            = {
          + "webserver-env" = "udacityProject"
        }
      + virtual_machine_id              = (known after apply)
      + zone                            = (known after apply)

      + os_disk {
          + caching                   = "ReadWrite"
          + disk_size_gb              = (known after apply)
          + name                      = "myosdisk2"
          + storage_account_type      = "Standard_LRS"
          + write_accelerator_enabled = false
        }
    }

  # azurerm_linux_virtual_machine.main[3] will be created
  + resource "azurerm_linux_virtual_machine" "main" {
      + admin_password                  = (sensitive value)
      + admin_username                  = "azureadmin"
      + allow_extension_operations      = true
      + availability_set_id             = (known after apply)
      + computer_name                   = (known after apply)
      + disable_password_authentication = false
      + extensions_time_budget          = "PT1H30M"
      + id                              = (known after apply)
      + location                        = "eastus"
      + max_bid_price                   = -1
      + name                            = "udacity-vm-3"
      + network_interface_ids           = (known after apply)
      + priority                        = "Regular"
      + private_ip_address              = (known after apply)
      + private_ip_addresses            = (known after apply)
      + provision_vm_agent              = true
      + public_ip_address               = (known after apply)
      + public_ip_addresses             = (known after apply)
      + resource_group_name             = "udacity-rg"
      + size                            = "Standard_B1ls"
      + source_image_id                 = "/subscriptions/9c790a0a-ea54-4253-900b-4e1b6af9f5d2/resourceGroups/udacity-rg/providers/Microsoft.Compute/images/myPackerImage"
      + tags                            = {
          + "webserver-env" = "udacityProject"
        }
      + virtual_machine_id              = (known after apply)
      + zone                            = (known after apply)

      + os_disk {
          + caching                   = "ReadWrite"
          + disk_size_gb              = (known after apply)
          + name                      = "myosdisk3"
          + storage_account_type      = "Standard_LRS"
          + write_accelerator_enabled = false
        }
    }

  # azurerm_managed_disk.main[0] will be created
  + resource "azurerm_managed_disk" "main" {
      + create_option        = "Empty"
      + disk_iops_read_write = (known after apply)
      + disk_mbps_read_write = (known after apply)
      + disk_size_gb         = 1
      + id                   = (known after apply)
      + location             = "eastus"
      + name                 = "udacity-disk-0"
      + resource_group_name  = "udacity-rg"
      + source_uri           = (known after apply)
      + storage_account_type = "Standard_LRS"
      + tags                 = {
          + "webserver-env" = "udacityProject"
        }
    }

  # azurerm_managed_disk.main[1] will be created
  + resource "azurerm_managed_disk" "main" {
      + create_option        = "Empty"
      + disk_iops_read_write = (known after apply)
      + disk_mbps_read_write = (known after apply)
      + disk_size_gb         = 1
      + id                   = (known after apply)
      + location             = "eastus"
      + name                 = "udacity-disk-1"
      + resource_group_name  = "udacity-rg"
      + source_uri           = (known after apply)
      + storage_account_type = "Standard_LRS"
      + tags                 = {
          + "webserver-env" = "udacityProject"
        }
    }

  # azurerm_managed_disk.main[2] will be created
  + resource "azurerm_managed_disk" "main" {
      + create_option        = "Empty"
      + disk_iops_read_write = (known after apply)
      + disk_mbps_read_write = (known after apply)
      + disk_size_gb         = 1
      + id                   = (known after apply)
      + location             = "eastus"
      + name                 = "udacity-disk-2"
      + resource_group_name  = "udacity-rg"
      + source_uri           = (known after apply)
      + storage_account_type = "Standard_LRS"
      + tags                 = {
          + "webserver-env" = "udacityProject"
        }
    }

  # azurerm_managed_disk.main[3] will be created
  + resource "azurerm_managed_disk" "main" {
      + create_option        = "Empty"
      + disk_iops_read_write = (known after apply)
      + disk_mbps_read_write = (known after apply)
      + disk_size_gb         = 1
      + id                   = (known after apply)
      + location             = "eastus"
      + name                 = "udacity-disk-3"
      + resource_group_name  = "udacity-rg"
      + source_uri           = (known after apply)
      + storage_account_type = "Standard_LRS"
      + tags                 = {
          + "webserver-env" = "udacityProject"
        }
    }

  # azurerm_network_interface.main[0] will be created
  + resource "azurerm_network_interface" "main" {
      + applied_dns_servers           = (known after apply)
      + dns_servers                   = (known after apply)
      + enable_accelerated_networking = false
      + enable_ip_forwarding          = false
      + id                            = (known after apply)
      + internal_dns_name_label       = (known after apply)
      + internal_domain_name_suffix   = (known after apply)
      + location                      = "eastus"
      + mac_address                   = (known after apply)
      + name                          = "udacity-nic-0"
      + private_ip_address            = (known after apply)
      + private_ip_addresses          = (known after apply)
      + resource_group_name           = "udacity-rg"
      + tags                          = {
          + "webserver-env" = "udacityProject"
        }
      + virtual_machine_id            = (known after apply)

      + ip_configuration {
          + name                          = "ipconfigudacity"
          + primary                       = (known after apply)
          + private_ip_address            = (known after apply)
          + private_ip_address_allocation = "dynamic"
          + private_ip_address_version    = "IPv4"
          + subnet_id                     = (known after apply)
        }
    }

  # azurerm_network_interface.main[1] will be created
  + resource "azurerm_network_interface" "main" {
      + applied_dns_servers           = (known after apply)
      + dns_servers                   = (known after apply)
      + enable_accelerated_networking = false
      + enable_ip_forwarding          = false
      + id                            = (known after apply)
      + internal_dns_name_label       = (known after apply)
      + internal_domain_name_suffix   = (known after apply)
      + location                      = "eastus"
      + mac_address                   = (known after apply)
      + name                          = "udacity-nic-1"
      + private_ip_address            = (known after apply)
      + private_ip_addresses          = (known after apply)
      + resource_group_name           = "udacity-rg"
      + tags                          = {
          + "webserver-env" = "udacityProject"
        }
      + virtual_machine_id            = (known after apply)

      + ip_configuration {
          + name                          = "ipconfigudacity"
          + primary                       = (known after apply)
          + private_ip_address            = (known after apply)
          + private_ip_address_allocation = "dynamic"
          + private_ip_address_version    = "IPv4"
          + subnet_id                     = (known after apply)
        }
    }

  # azurerm_network_interface.main[2] will be created
  + resource "azurerm_network_interface" "main" {
      + applied_dns_servers           = (known after apply)
      + dns_servers                   = (known after apply)
      + enable_accelerated_networking = false
      + enable_ip_forwarding          = false
      + id                            = (known after apply)
      + internal_dns_name_label       = (known after apply)
      + internal_domain_name_suffix   = (known after apply)
      + location                      = "eastus"
      + mac_address                   = (known after apply)
      + name                          = "udacity-nic-2"
      + private_ip_address            = (known after apply)
      + private_ip_addresses          = (known after apply)
      + resource_group_name           = "udacity-rg"
      + tags                          = {
          + "webserver-env" = "udacityProject"
        }
      + virtual_machine_id            = (known after apply)

      + ip_configuration {
          + name                          = "ipconfigudacity"
          + primary                       = (known after apply)
          + private_ip_address            = (known after apply)
          + private_ip_address_allocation = "dynamic"
          + private_ip_address_version    = "IPv4"
          + subnet_id                     = (known after apply)
        }
    }

  # azurerm_network_interface.main[3] will be created
  + resource "azurerm_network_interface" "main" {
      + applied_dns_servers           = (known after apply)
      + dns_servers                   = (known after apply)
      + enable_accelerated_networking = false
      + enable_ip_forwarding          = false
      + id                            = (known after apply)
      + internal_dns_name_label       = (known after apply)
      + internal_domain_name_suffix   = (known after apply)
      + location                      = "eastus"
      + mac_address                   = (known after apply)
      + name                          = "udacity-nic-3"
      + private_ip_address            = (known after apply)
      + private_ip_addresses          = (known after apply)
      + resource_group_name           = "udacity-rg"
      + tags                          = {
          + "webserver-env" = "udacityProject"
        }
      + virtual_machine_id            = (known after apply)

      + ip_configuration {
          + name                          = "ipconfigudacity"
          + primary                       = (known after apply)
          + private_ip_address            = (known after apply)
          + private_ip_address_allocation = "dynamic"
          + private_ip_address_version    = "IPv4"
          + subnet_id                     = (known after apply)
        }
    }

  # azurerm_network_security_group.main will be created
  + resource "azurerm_network_security_group" "main" {
      + id                  = (known after apply)
      + location            = "eastus"
      + name                = "udacity-nsg"
      + resource_group_name = "udacity-rg"
      + security_rule       = [
          + {
              + access                                     = "Deny"
              + description                                = ""
              + destination_address_prefix                 = "*"
              + destination_address_prefixes               = []
              + destination_application_security_group_ids = []
              + destination_port_range                     = "*"
              + destination_port_ranges                    = []
              + direction                                  = "Inbound"
              + name                                       = "DenyVNet-Inbound"
              + priority                                   = 800
              + protocol                                   = "*"
              + source_address_prefix                      = "*"
              + source_address_prefixes                    = []
              + source_application_security_group_ids      = []
              + source_port_range                          = "*"
              + source_port_ranges                         = []
            },
        ]
      + tags                = {
          + "webserver-env" = "udacityProject"
        }
    }

  # azurerm_public_ip.main will be created
  + resource "azurerm_public_ip" "main" {
      + allocation_method       = "Static"
      + fqdn                    = (known after apply)
      + id                      = (known after apply)
      + idle_timeout_in_minutes = 4
      + ip_address              = (known after apply)
      + ip_version              = "IPv4"
      + location                = "eastus"
      + name                    = "udacity-vm-ip"
      + resource_group_name     = "udacity-rg"
      + sku                     = "Basic"
      + tags                    = {
          + "webserver-env" = "udacityProject"
        }
    }

  # azurerm_subnet.main will be created
  + resource "azurerm_subnet" "main" {
      + address_prefix                                 = (known after apply)
      + address_prefixes                               = [
          + "10.0.0.0/24",
        ]
      + enforce_private_link_endpoint_network_policies = false
      + enforce_private_link_service_network_policies  = false
      + id                                             = (known after apply)
      + name                                           = "udacity-subnet"
      + resource_group_name                            = "udacity-rg"
      + virtual_network_name                           = "udacity-network"
    }

  # azurerm_virtual_network.main will be created
  + resource "azurerm_virtual_network" "main" {
      + address_space         = [
          + "10.0.0.0/16",
        ]
      + guid                  = (known after apply)
      + id                    = (known after apply)
      + location              = "eastus"
      + name                  = "udacity-network"
      + resource_group_name   = "udacity-rg"
      + subnet                = (known after apply)
      + tags                  = {
          + "webserver-env" = "udacityProject"
        }
      + vm_protection_enabled = false
    }

Plan: 19 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

This plan was saved to: solution.plan

To perform exactly these actions, run the following command to apply:
    terraform apply "solution.plan"

kulivoko@kuli:~/Documents/Udacity/Deploying resources using Terraform$ terraform apply "solution.plan"
azurerm_virtual_network.main: Creating...
azurerm_managed_disk.main[2]: Creating...
azurerm_availability_set.main: Creating...
azurerm_managed_disk.main[1]: Creating...
azurerm_managed_disk.main[0]: Creating...
azurerm_public_ip.main: Creating...
azurerm_managed_disk.main[3]: Creating...
azurerm_network_security_group.main: Creating...
azurerm_availability_set.main: Creation complete after 4s [id=/subscriptions/9c790a0a-ea54-4253-900b-4e1b6af9f5d2/resourceGroups/udacity-rg/providers/Microsoft.Compute/availabilitySets/udacity-aset]
azurerm_public_ip.main: Creation complete after 6s [id=/subscriptions/9c790a0a-ea54-4253-900b-4e1b6af9f5d2/resourceGroups/udacity-rg/providers/Microsoft.Network/publicIPAddresses/udacity-vm-ip]
azurerm_lb.main: Creating...
azurerm_managed_disk.main[3]: Creation complete after 7s [id=/subscriptions/9c790a0a-ea54-4253-900b-4e1b6af9f5d2/resourceGroups/udacity-rg/providers/Microsoft.Compute/disks/udacity-disk-3]
azurerm_managed_disk.main[0]: Creation complete after 7s [id=/subscriptions/9c790a0a-ea54-4253-900b-4e1b6af9f5d2/resourceGroups/udacity-rg/providers/Microsoft.Compute/disks/udacity-disk-0]
azurerm_managed_disk.main[1]: Creation complete after 7s [id=/subscriptions/9c790a0a-ea54-4253-900b-4e1b6af9f5d2/resourceGroups/udacity-rg/providers/Microsoft.Compute/disks/udacity-disk-1]
azurerm_managed_disk.main[2]: Creation complete after 7s [id=/subscriptions/9c790a0a-ea54-4253-900b-4e1b6af9f5d2/resourceGroups/udacity-rg/providers/Microsoft.Compute/disks/udacity-disk-2]
azurerm_virtual_network.main: Creation complete after 8s [id=/subscriptions/9c790a0a-ea54-4253-900b-4e1b6af9f5d2/resourceGroups/udacity-rg/providers/Microsoft.Network/virtualNetworks/udacity-network]
azurerm_network_security_group.main: Creation complete after 8s [id=/subscriptions/9c790a0a-ea54-4253-900b-4e1b6af9f5d2/resourceGroups/udacity-rg/providers/Microsoft.Network/networkSecurityGroups/udacity-nsg]
azurerm_subnet.main: Creating...
azurerm_lb.main: Creation complete after 5s [id=/subscriptions/9c790a0a-ea54-4253-900b-4e1b6af9f5d2/resourceGroups/udacity-rg/providers/Microsoft.Network/loadBalancers/udacity-lb]
azurerm_lb_backend_address_pool.main: Creating...
azurerm_subnet.main: Creation complete after 5s [id=/subscriptions/9c790a0a-ea54-4253-900b-4e1b6af9f5d2/resourceGroups/udacity-rg/providers/Microsoft.Network/virtualNetworks/udacity-network/subnets/udacity-subnet]
azurerm_network_interface.main[1]: Creating...
azurerm_network_interface.main[3]: Creating...
azurerm_network_interface.main[0]: Creating...
azurerm_network_interface.main[2]: Creating...
azurerm_lb_backend_address_pool.main: Creation complete after 3s [id=/subscriptions/9c790a0a-ea54-4253-900b-4e1b6af9f5d2/resourceGroups/udacity-rg/providers/Microsoft.Network/loadBalancers/udacity-lb/backendAddressPools/BackEndAddressPool]
azurerm_network_interface.main[2]: Creation complete after 6s [id=/subscriptions/9c790a0a-ea54-4253-900b-4e1b6af9f5d2/resourceGroups/udacity-rg/providers/Microsoft.Network/networkInterfaces/udacity-nic-2]
azurerm_network_interface.main[3]: Creation complete after 9s [id=/subscriptions/9c790a0a-ea54-4253-900b-4e1b6af9f5d2/resourceGroups/udacity-rg/providers/Microsoft.Network/networkInterfaces/udacity-nic-3]
azurerm_network_interface.main[1]: Still creating... [10s elapsed]
azurerm_network_interface.main[0]: Still creating... [10s elapsed]
azurerm_network_interface.main[0]: Creation complete after 12s [id=/subscriptions/9c790a0a-ea54-4253-900b-4e1b6af9f5d2/resourceGroups/udacity-rg/providers/Microsoft.Network/networkInterfaces/udacity-nic-0]
azurerm_network_interface.main[1]: Creation complete after 15s [id=/subscriptions/9c790a0a-ea54-4253-900b-4e1b6af9f5d2/resourceGroups/udacity-rg/providers/Microsoft.Network/networkInterfaces/udacity-nic-1]
azurerm_linux_virtual_machine.main[3]: Creating...
azurerm_linux_virtual_machine.main[1]: Creating...
azurerm_linux_virtual_machine.main[2]: Creating...
azurerm_linux_virtual_machine.main[0]: Creating...
azurerm_linux_virtual_machine.main[2]: Still creating... [10s elapsed]
azurerm_linux_virtual_machine.main[3]: Still creating... [10s elapsed]
azurerm_linux_virtual_machine.main[1]: Still creating... [10s elapsed]
azurerm_linux_virtual_machine.main[0]: Still creating... [10s elapsed]
azurerm_linux_virtual_machine.main[1]: Still creating... [20s elapsed]
azurerm_linux_virtual_machine.main[0]: Still creating... [20s elapsed]
azurerm_linux_virtual_machine.main[3]: Still creating... [20s elapsed]
azurerm_linux_virtual_machine.main[2]: Still creating... [20s elapsed]
azurerm_linux_virtual_machine.main[2]: Still creating... [30s elapsed]
azurerm_linux_virtual_machine.main[0]: Still creating... [30s elapsed]
azurerm_linux_virtual_machine.main[3]: Still creating... [30s elapsed]
azurerm_linux_virtual_machine.main[1]: Still creating... [30s elapsed]
azurerm_linux_virtual_machine.main[1]: Still creating... [40s elapsed]
azurerm_linux_virtual_machine.main[3]: Still creating... [40s elapsed]
azurerm_linux_virtual_machine.main[0]: Still creating... [40s elapsed]
azurerm_linux_virtual_machine.main[2]: Still creating... [40s elapsed]
azurerm_linux_virtual_machine.main[3]: Still creating... [50s elapsed]
azurerm_linux_virtual_machine.main[0]: Still creating... [50s elapsed]
azurerm_linux_virtual_machine.main[2]: Still creating... [50s elapsed]
azurerm_linux_virtual_machine.main[1]: Still creating... [50s elapsed]
azurerm_linux_virtual_machine.main[2]: Still creating... [1m0s elapsed]
azurerm_linux_virtual_machine.main[0]: Still creating... [1m0s elapsed]
azurerm_linux_virtual_machine.main[1]: Still creating... [1m0s elapsed]
azurerm_linux_virtual_machine.main[3]: Still creating... [1m0s elapsed]
azurerm_linux_virtual_machine.main[3]: Still creating... [1m10s elapsed]
azurerm_linux_virtual_machine.main[2]: Still creating... [1m10s elapsed]
azurerm_linux_virtual_machine.main[1]: Still creating... [1m10s elapsed]
azurerm_linux_virtual_machine.main[0]: Still creating... [1m10s elapsed]
azurerm_linux_virtual_machine.main[0]: Still creating... [1m20s elapsed]
azurerm_linux_virtual_machine.main[3]: Still creating... [1m20s elapsed]
azurerm_linux_virtual_machine.main[1]: Still creating... [1m20s elapsed]
azurerm_linux_virtual_machine.main[2]: Still creating... [1m20s elapsed]
azurerm_linux_virtual_machine.main[3]: Still creating... [1m30s elapsed]
azurerm_linux_virtual_machine.main[2]: Still creating... [1m30s elapsed]
azurerm_linux_virtual_machine.main[0]: Still creating... [1m30s elapsed]
azurerm_linux_virtual_machine.main[1]: Still creating... [1m30s elapsed]
azurerm_linux_virtual_machine.main[3]: Still creating... [1m40s elapsed]
azurerm_linux_virtual_machine.main[1]: Still creating... [1m40s elapsed]
azurerm_linux_virtual_machine.main[0]: Still creating... [1m40s elapsed]
azurerm_linux_virtual_machine.main[2]: Still creating... [1m40s elapsed]
azurerm_linux_virtual_machine.main[2]: Still creating... [1m50s elapsed]
azurerm_linux_virtual_machine.main[0]: Still creating... [1m50s elapsed]
azurerm_linux_virtual_machine.main[3]: Still creating... [1m50s elapsed]
azurerm_linux_virtual_machine.main[1]: Still creating... [1m50s elapsed]
azurerm_linux_virtual_machine.main[2]: Creation complete after 1m52s [id=/subscriptions/9c790a0a-ea54-4253-900b-4e1b6af9f5d2/resourceGroups/udacity-rg/providers/Microsoft.Compute/virtualMachines/udacity-vm-2]
azurerm_linux_virtual_machine.main[0]: Creation complete after 1m53s [id=/subscriptions/9c790a0a-ea54-4253-900b-4e1b6af9f5d2/resourceGroups/udacity-rg/providers/Microsoft.Compute/virtualMachines/udacity-vm-0]
azurerm_linux_virtual_machine.main[3]: Creation complete after 1m53s [id=/subscriptions/9c790a0a-ea54-4253-900b-4e1b6af9f5d2/resourceGroups/udacity-rg/providers/Microsoft.Compute/virtualMachines/udacity-vm-3]
azurerm_linux_virtual_machine.main[1]: Creation complete after 1m53s [id=/subscriptions/9c790a0a-ea54-4253-900b-4e1b6af9f5d2/resourceGroups/udacity-rg/providers/Microsoft.Compute/virtualMachines/udacity-vm-1]

Apply complete! Resources: 19 added, 0 changed, 0 destroyed.

The state of your infrastructure has been saved to the path
below. This state is required to modify and destroy your
infrastructure, so keep it safe. To inspect the complete state
use the `terraform show` command.

State path: terraform.tfstate

