# Configure the minimum required providers supported by this module
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.107"
      configuration_aliases = [
        azurerm.connectivity,
        azurerm.management,
      ]
    }
    time = {
      source  = "hashicorp/time"
      version = "~> 0.11"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
    azapi = {
      source  = "Azure/azapi"
      version = "~> 1.13, != 1.13.0"
    }
  }
  required_version = "~> 1.7"
}

provider "azurerm" {
  use_oidc = true
  features {}
}
provider "azurerm" {
  subscription_id = var.subscription_id_connectivity
  features {}
  alias = "connectivity"
}
provider "azurerm" {
  subscription_id = var.subscription_id_management 
  features {}
  alias = "management"
}

provider "azapi" {
  use_oidc = true
}