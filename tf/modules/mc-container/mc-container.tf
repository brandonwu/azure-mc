resource "azurerm_container_group" "mc" {
  name                = "mc-container-group"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  container {
    name   = "mc-server"
    image  = "itzg/minecraft-server"
    cpu    = var.cpu
    memory = var.ram
    ports {
      port     = 25565
      protocol = "TCP"
    }
    environment_variables = {
      EULA                = "true"
      VERSION             = var.minecraft_version
      TYPE                = var.minecraft_type
      ENABLE_RCON         = var.minecraft_rcon
      INIT_MEMORY         = "1G"
      MAX_MEMORY          = "${var.ram_jvm}G"
      BUILD_FROM_SOURCE   = var.build_from_source
      CONSOLE             = "false"
      SPIGOT_DOWNLOAD_URL = var.spigot_download_url
    }
    secure_environment_variables = {
      RCON_PASSWORD = var.minecraft_rcon_pwd
    }
    volume {
      name                 = "mc-data"
      mount_path           = "/data"
      storage_account_name = var.storage_account_name
      storage_account_key  = var.storage_account_key
      share_name           = azurerm_storage_share.mc.name
    }
    readiness_probe {
      exec                  = ["mcstatus", "localhost"]
      initial_delay_seconds = 30
    }
  }

  os_type         = "Linux"
  dns_name_label  = "mccontigrp"
  ip_address_type = "Public"

}

resource "azurerm_storage_share" "mc" {
  name                 = "mc-data"
  storage_account_name = var.storage_account_name
  quota                = var.storage_quota
}
