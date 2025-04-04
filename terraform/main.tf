provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = rg-azfuncapp
  location = East US
}

resource "azurerm_storage_account" "sa" {
  name                     = sa-azfuncapp
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_app_service_plan" "asp" {
  name                = appservplanazfunc
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  kind                = "FunctionApp"
  reserved            = true
  sku {
    tier = "Dynamic"
    size = "Y1"
  }
}

resource "azurerm_function_app" "func" {
  name                = fa-azfuncapp
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  storage_account_name       = azurerm_storage_account.sa.name
  storage_account_access_key = azurerm_storage_account.sa.primary_access_key
  app_service_plan_id        = azurerm_app_service_plan.asp.id
  
  site_config {
    linux_fx_version = "PYTHON|3.8"  # Correct way to specify runtime
  }
}
