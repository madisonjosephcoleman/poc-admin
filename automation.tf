resource "azurerm_automation_account" "aaa" {
  name                = "account1"
  location            = var.location
  resource_group_name = module.rg.name
  sku_name = "Basic"
  
}

data "local_file" "example" {
  filename = "${path.module}/vm-schedule.ps1"
}

resource "azurerm_automation_runbook" "example" {
  name                    = "Get-AzureVMTutorial"
  location                = var.location
  resource_group_name     = module.rg.name
  automation_account_name = azurerm_automation_account.aaa.name
  log_verbose             = "true"
  log_progress            = "true"
  description             = "This is an example runbook"
  runbook_type            = "PowerShell"

  content = data.local_file.example.content
}


resource "azurerm_automation_job_schedule" "job" {
  resource_group_name     = module.rg.name
  automation_account_name = azurerm_automation_account.aaa.name
  schedule_name           = azurerm_automation_schedule.schedule.name
  runbook_name            = azurerm_automation_runbook.example.name

  parameters = {

     azuresubscriptionname = "${data.azurerm_subscription.current.display_name}"
     azurecredentialname = "default" 
  }
}




resource "azurerm_automation_schedule" "schedule" {
  name                    = "tfex-automation-schedule"
  resource_group_name     = module.rg.name
  automation_account_name = azurerm_automation_account.aaa.name
  frequency               = "Hour"
  interval                = 1
  timezone                = "Central Standard Time"
  start_time              = null
  description             = "This is an example schedule"
  week_days               = null
}


resource "azurerm_automation_credential" "cred" {
  name                    = "default"
  resource_group_name     = module.rg.name
  automation_account_name = azurerm_automation_account.aaa.name
  username                = "Default@das.consulting"
  password                = "Chiefs17"
  description             = "This is an example credential"
}



data "azurerm_subscription" "current" {
}

output "current_subscription_display_name" {
  value = data.azurerm_subscription.current.display_name
}