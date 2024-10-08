# Input variable definitions
variable "id" {
  description = "The ID of your project - usually a defining set of numbers or an ID"
  type = string
}

variable "env" {
  description = "The environment - usually dev or prod or test"
}

variable "location" {
  description = "The Azure Region in which all resources should be created."
  type        = string
}
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "vnet_name" {
  description = "The name of the VNet - preexisting vnet name, entered here"
  type        = string
}

variable "subnet_name" {
  description = "The name of the Subnet - preexisting subnet name, entered here"
  type        = string
}
variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
}
variable "storage_account_tier" {
  description = "Storage Account Tier"
  type        = string
}
variable "storage_account_replication_type" {
  description = "Storage Account Replication Type"
  type        = string
}
variable "storage_account_kind" {
  description = "Storage Account Kind"
  type        = string
}
