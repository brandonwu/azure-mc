variable "resource_group_name" {
  type        = string
  description = "Name of the resource group to put all resources in"
}

variable "resource_group_location" {
  type        = string
  description = "Location of the resource group to put all resources in"
}

variable "storage_account_name" {
  type        = string
  description = "Name of the storage account for the container file share (this must be a StorageV2 or File account)"
}

variable "storage_account_key" {
  type        = string
  description = "Access key for the storage account"
}

variable "storage_quota" {
  type        = number
  description = "Size quota in GB for the container file share"
}

variable "cpu" {
  type        = number
  description = "vCPU count for server container"
}

variable "ram" {
  type        = number
  description = "GB of memory for server container"
}

variable "ram_jvm" {
  type        = number
  description = "GB of memory for JVM"
}

variable "minecraft_version" {
  type        = string
  description = "Version of Minecraft to run: LATEST, SNAPSHOT, or a specific version number"
  default     = "LATEST"
}

variable "minecraft_type" {
  type        = string
  description = "Type of Minecraft server to run: VANILLA, FORGE, BUKKIT, SPIGOT, PAPER, CURSEFORGE, or SPONGEVANILLA"
  default     = "VANILLA"
}

variable "minecraft_rcon" {
  type        = bool
  description = "True to enable RCON"
  default     = false
}

variable "minecraft_rcon_pwd" {
  type        = string
  description = "Password for RCON if enabled"
}

variable "build_from_source" {
  type        = bool
  description = "True to build Spigot/Bukkit from source"
  default     = false
}

variable "spigot_download_url" {
  type        = string
  description = "URL to download Spigot from"
}
