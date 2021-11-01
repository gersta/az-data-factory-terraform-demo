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
        creater = "Terraform"
        project = "terraform-demo"
    }
}