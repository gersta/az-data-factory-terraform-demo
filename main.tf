terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "~>2.0"
    }
  }

  backend "azurerm" {
        resource_group_name  = "terraform-backend"
        storage_account_name = "terraformbackendetldemo"
        container_name       = "tfstate"
        key                  = "terraform.tfstate"
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

module "blob-storage" {
  source = "./modules/blob-storage"

  resource_group_name = azurerm_resource_group.terraform-demo.name
  location = azurerm_resource_group.terraform-demo.location
}

resource "azurerm_data_factory" "terraform-demo-factory" {
  name                = "terraform-demo-factory"
  location            = azurerm_resource_group.terraform-demo.location
  resource_group_name = azurerm_resource_group.terraform-demo.name
  github_configuration {
    account_name = "gersta"
    branch_name = "adf_publish"
    git_url = "https://github.com/gersta/azure-data-factory-etl-demo"
    repository_name = "azure-data-factory-etl-demo"
    root_folder = "/"
  }

  tags = {
        creator = "Terraform"
        project = "terraform-demo"
  }
}