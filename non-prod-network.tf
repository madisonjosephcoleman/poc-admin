resource "azurerm_virtual_network" "non-prod-vnet" {
  name                = "non-prod-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = module.rg.name
}

resource "azurerm_subnet" "non-prod-infra" {
  name                 = "non-prod-infra"
  resource_group_name  = module.rg.name
  virtual_network_name = azurerm_virtual_network.non-prod-vnet.name
  address_prefixes     = ["10.0.1.0/24"]


}

resource "azurerm_subnet" "non-prod-data" {
  name                 = "non-prod-data"
  resource_group_name  = module.rg.name
  virtual_network_name = azurerm_virtual_network.non-prod-vnet.name
  address_prefixes     = ["10.0.2.0/24"]


}


