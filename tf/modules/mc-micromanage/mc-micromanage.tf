// function service service plan consumption-based
// function app service with proxy
// blob storage for files
resource "azurerm_storage_container" "mc" {
  name                  = "mc-micromanage"
  storage_account_name  = var.storage_account_name
  container_access_type = "blob"
}

resource "azurerm_storage_blob" "spigot_server_blob" {
  name                   = "spigot_server.jar"
  storage_account_name   = var.storage_account_name
  storage_container_name = azurerm_storage_container.mc.name
  type                   = "Block"
  source                 = var.spigot_server_filename
}
