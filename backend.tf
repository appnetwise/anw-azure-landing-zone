terraform {
  backend "azurerm" {
     use_oidc             = true
     resource_group_name  = "rg-err-anw-mgmt-mgmt"
     storage_account_name = "sterranwmgmtsa"
     container_name       = "tfstate"
     key                  = "mgmt/identity.tfstate" 
     subscription_id      = "ea0a0669-7cd7-4792-aadb-8f128ca2dfef"
  }
}