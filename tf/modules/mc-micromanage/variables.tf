variable "resource_group_name" {
  type        = string
  description = "Name of the resource group to put all resources in"
}

variable "storage_account_name" {
  type        = string
  description = "Name of the storage account for the container file share (this must be a StorageV2 or File account)"
}

variable "spigot_server_filename" {
  type        = string
  description = "Path to the Spigot server jar"
  default     = ""
}

