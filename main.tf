# Provider Block
provider "azurerm" {
 features {}          
}

# Random String Resource
resource "random_string" "myrandom" {
  length = 6
  upper = false 
  special = false
  number = false   
}

# Create Resource Group
resource "azurerm_resource_group" "resource_group" {
  name     = var.resource_group_name
  location = var.location
}

# Create Azure Storage account
resource "azurerm_storage_account" "storage_account" {
  name                = "${var.storage_account_name}${random_string.myrandom.id}"
  resource_group_name = azurerm_resource_group.resource_group.name
 
  location                 = var.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
  account_kind             = var.storage_account_kind
 
}

# Open AI Resource

# Private Endpoint for Open AI Resource

# Key Vault

# Private Endpoint for Key Vault

# Document Intelligence

# Document Intelligence Private Endpoint

# Text Translation

# Text Translation Private Endpoint

# Managed Identity

# KV Access Policies

# MI RA for Storage Account

# MI RA for Key Vault

# MI RA for Document Intelligence

# MI RA for Text Translation

resource "azurerm_virtual_network" "example" {
  name                = var.vnet_name
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "example" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_private_endpoint" "openai" {
  name                = "openai-private-endpoint"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = azurerm_subnet.example.id

  private_service_connection {
    name                           = "openai-privateserviceconnection"
    private_connection_resource_id = azurerm_openai_service.example.id
    is_manual_connection           = false
    subresource_names              = ["openai"]
  }
}

resource "azurerm_private_endpoint" "search" {
  name                = "search-private-endpoint"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = azurerm_subnet.example.id

  private_service_connection {
    name                           = "search-privateserviceconnection"
    private_connection_resource_id = azurerm_search_service.example.id
    is_manual_connection           = false
    subresource_names              = ["search"]
  }
}

resource "azurerm_private_endpoint" "form_recognizer" {
  name                = "form-recognizer-private-endpoint"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = azurerm_subnet.example.id

  private_service_connection {
    name                           = "form-recognizer-privateserviceconnection"
    private_connection_resource_id = azurerm_form_recognizer_service.example.id
    is_manual_connection           = false
    subresource_names              = ["form-recognizer"]
  }
}

resource "azurerm_private_endpoint" "text_translation" {
  name                = "text-translation-private-endpoint"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = azurerm_subnet.example.id

  private_service_connection {
    name                           = "text-translation-privateserviceconnection"
    private_connection_resource_id = azurerm_text_translation_service.example.id
    is_manual_connection           = false
    subresource_names              = ["text-translation"]
  }
}