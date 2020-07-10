




provider "azurerm" {

  version = "=2.16.0"


  features {
    key_vault {

      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}











data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}




module "rg" {
  source = "git::git@github.com:madisonjosephcoleman/azurerm.git//modules/resource-group"
  tags = { "key" = "value"
  }
  name     = "rg-${var.subscription_abbreviation}-${var.application_short_name}-${var.Environment}"
  location = "northcentralus"
}










module "client-config" {
  source = "git::git@github.com:madisonjosephcoleman/azurerm.git//modules/data-client-config"

}