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
