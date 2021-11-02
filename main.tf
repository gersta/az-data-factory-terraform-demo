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

resource "azurerm_storage_container" "terraform-demo" {
  name                  = "terraform-demo"
  storage_account_name  = azurerm_storage_account.terraform-demo.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "tab-projects" {
  name                   = "Tab_Projects.csv"
  storage_account_name   = azurerm_storage_account.terraform-demo.name
  storage_container_name = azurerm_storage_container.terraform-demo.name
  type                   = "Block"
  source                 = "./data-factory-datasets/Tab_Projects.csv"

  metadata = {
        creator = "Terraform"
        project = "terraform-demo"
  }
}

resource "azurerm_storage_blob" "tab-leads" {
  name                   = "Tab_Leads.csv"
  storage_account_name   = azurerm_storage_account.terraform-demo.name
  storage_container_name = azurerm_storage_container.terraform-demo.name
  type                   = "Block"
  source                 = "./data-factory-datasets/Tab_Leads.csv"

  metadata = {
        creator = "Terraform"
        project = "terraform-demo"
  }
}

resource "azurerm_storage_blob" "tab-expenses" {
  name                   = "Tab_Expenses.csv"
  storage_account_name   = azurerm_storage_account.terraform-demo.name
  storage_container_name = azurerm_storage_container.terraform-demo.name
  type                   = "Block"
  source                 = "./data-factory-datasets/Tab_Expenses.csv"

  metadata = {
        creator = "Terraform"
        project = "terraform-demo"
  }
}

resource "azurerm_storage_blob" "tab-geo-data" {
  name                   = "Tab_Geo_Data.csv"
  storage_account_name   = azurerm_storage_account.terraform-demo.name
  storage_container_name = azurerm_storage_container.terraform-demo.name
  type                   = "Block"
  source                 = "./data-factory-datasets/Tab_Geo_Data.csv"

  metadata = {
        creator = "Terraform"
        project = "terraform-demo"
  }
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