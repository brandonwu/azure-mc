locals {
  version      = "1.15.2"
  type         = "SPIGOT"
  rcon_enabled = true
}

variable "rcon_pwd" {
  type        = string
  description = "Password for RCON, if enabled one must be set"
}

variable "spigot_server_filename" {
  type        = string
  description = "Path to Spigot server jar"
}

provider "azurerm" {
  version = "~>2.0"
  features {}
}

resource "azurerm_resource_group" "mc" {
  name     = "mc"
  location = "West US 2"
}

resource "azurerm_storage_account" "mc" {
  name                     = "mcstorageacct9fe0a"
  resource_group_name      = azurerm_resource_group.mc.name
  location                 = azurerm_resource_group.mc.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
}

module "mc-container" {
  source                  = "./modules/mc-container"
  resource_group_name     = azurerm_resource_group.mc.name
  resource_group_location = azurerm_resource_group.mc.location
  storage_account_name    = azurerm_storage_account.mc.name
  storage_account_key     = azurerm_storage_account.mc.primary_access_key
  storage_quota           = 10
  minecraft_version       = local.version
  minecraft_type          = local.type
  minecraft_rcon          = local.rcon_enabled
  minecraft_rcon_pwd      = var.rcon_pwd
  cpu                     = 1
  ram                     = 2.5
  ram_jvm                 = 2
  spigot_download_url     = module.mc-micromanage.spigot_server_url
}

module "mc-micromanage" {
  source                 = "./modules/mc-micromanage"
  resource_group_name    = azurerm_resource_group.mc.name
  storage_account_name   = azurerm_storage_account.mc.name
  spigot_server_filename = var.spigot_server_filename
}

output "ip" {
  value = module.mc-container.ip
}

output "fqdn" {
  value = module.mc-container.fqdn
}

output "file_share_url" {
  value = module.mc-container.file_share_url
}

output "file_share_id" {
  value = module.mc-container.file_share_id
}
