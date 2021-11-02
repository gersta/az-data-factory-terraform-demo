terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "~>2.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "terraform-demo" {
    name = "terraform-demo"
    location = "westeurope"

    tags = {
        creator = "Terraform"
        project = "terraform-demo"
    }
}

resource "azurerm_storage_account" "terraform-demo" {
    name = "terraformetldemo"
    resource_group_name = azurerm_resource_group.terraform-demo.name
    location = azurerm_resource_group.terraform-demo.location
    account_tier = "Standard"
    account_replication_type = "LRS"

    tags = {
        creator = "Terraform"
        project = "terraform-demo"
    }
}