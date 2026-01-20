variable "proxmox_endpoint" {
  description = "Proxmox API endpoint (e.g. https://pve:8006)"
  type        = string
}

variable "proxmox_api_token" {
  description = "Proxmox API token in the form user@realm!tokenid=secret"
  type        = string
  sensitive   = true
}

variable "proxmox_insecure" {
  description = "Allow insecure TLS (self-signed certs)"
  type        = bool
  default     = false
}

variable "proxmox_ssh_username" {
  description = "SSH username for Proxmox node (for uploading snippets)"
  type        = string
  default     = "root"
}

variable "node_name" {
  description = "Proxmox node on which to place the VM"
  type        = string
}

variable "template_id" {
  description = "Ubuntu template VMID"
  type        = number
}

variable "datastore_id" {
  description = "Datastore for VM disks"
  type        = string
}

variable "snippets_datastore_id" {
  description = "Datastore for cloud-init snippets (must have snippets content type enabled)"
  type        = string
}

variable "network_bridge" {
  description = "Network bridge"
  type        = string
  default     = "vmbr0"
}

variable "cores" {
  description = "vCPU cores"
  type        = number
  default     = 4
}

variable "memory_mb" {
  description = "Memory in MB"
  type        = number
  default     = 8192
}

variable "disk_gb" {
  description = "Disk size in GB"
  type        = number
  default     = 50
}

variable "k8s" {
  description = "Kubernetes configuration"
  type = object({
    enabled = bool
    distro  = optional(string)
    version = optional(string)
  })
  default = {
    enabled = false
  }
}
