variable "prefix" {
  description = "The prefix which should be used for all resources in this example"
  default = "udacity-test"
}

variable "location" {
  description = "The Azure Region in which all resources in this example should be created."
  default = "East US"
}

variable "admin_username" {
  type        = string
  description = "Administrator user name for virtual machine"
}

variable "admin_password" {
  type        = string
  description = "Password must meet Azure complexity requirements"
}

variable "vm_size" {
  default = "Standard_B1ls"
  description = "The size of the VM"
}
