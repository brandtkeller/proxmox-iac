variable "name" {
  description = "VM name"
  type        = string
}

variable "node_name" {
  description = "Proxmox node on which to create the VM"
  type        = string
}

variable "template_id" {
  description = "Source VMID for cloning"
  type        = number
}

variable "cores" {
  description = "Number of vCPU cores"
  type        = number
  default     = 2
}

variable "memory_mb" {
  description = "Memory in MB"
  type        = number
  default     = 2048
}

variable "disk_gb" {
  description = "Root disk size in GB"
  type        = number
  default     = 32
}

variable "datastore_id" {
  description = "Proxmox datastore ID (e.g. local-lvm, local-btrfs)"
  type        = string
}

variable "network_bridge" {
  description = "Proxmox network bridge (e.g. vmbr0)"
  type        = string
  default     = "vmbr0"
}

variable "cloudinit_userdata" {
  description = "Rendered cloud-init user-data"
  type        = string
}

variable "tags" {
  description = "Tags applied to the VM"
  type        = list(string)
  default     = []
}
