# variables.tf

variable "proxmox_api_token" {
  description = "api token for proxmox"
  type        = string
  sensitive   = true
}

variable "endpoint" {
  description = "proxmox url"
  type        = string
}

variable "insecure_endpoint" {
  description = "Ignore self signed cert"
  type        = bool
  default     = true
}

variable "resource_description" {
  description = "Resource description"
  type        = string
}

variable "node_name" {
  description = "proxmox node"
  type        = string
}

variable "vm_id_template" {
  description = "id to clone from"
  type        = number
}

variable "vm_name" {
  description = "Name of VM"
  type        = string
}

variable "cores" {
  description = "Number of cores"
  type        = number
  default     = 2
}

variable "memory" {
  description = "RAM to use"
  type        = number
  default     = 2048
}

variable "disk_size" {
  description = "Size of disk in GB"
  type        = number
  default     = 20
}

variable "ipv4_address" {
  description = "IPv4 address"
  type        = string
  default     = "dhcp"
}

variable "username" {
  description = "User name"
  type        = string
  default     = "root"
}

variable "pub_key_path" {
  description = "Path to public key"
  type        = string
  default     = "~/.ssh/id_ed25519.pub"
}
