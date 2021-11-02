variable "resource_group_name" {
    type = string
}

variable "location" {
    type = string
}

resource "azurerm_storage_account" "terraform-demo" {
    name = "terraformetldemo"
    resource_group_name = var.resource_group_name
    location = var.location
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