output "container_group_id" {
  value = azurerm_container_group.mc.id
}

output "ip" {
  value = azurerm_container_group.mc.ip_address
}

output "fqdn" {
  value = azurerm_container_group.mc.fqdn
}

output "file_share_url" {
  value = azurerm_storage_share.mc.url
}

output "file_share_id" {
  value = azurerm_storage_share.mc.id
}
