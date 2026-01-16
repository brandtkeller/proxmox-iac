variable "proxmox_endpoint" {
  description = "Proxmox API endpoint (e.g. https://pve01:8006/api2/json)"
  type        = string
}

variable "proxmox_api_token" {
  description = "Proxmox API token in the form user@realm!token"
  type        = string
  sensitive   = true
}

variable "proxmox_insecure" {
  description = "Allow insecure TLS (self-signed certs)"
  type        = bool
  default     = false
}

variable "ubuntu_template_id" {
  description = "Proxmox VMID for the Ubuntu cloud-init template"
  type        = number
  default     = 9000
}