terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0.93"
    }
  }
}

resource "proxmox_virtual_environment_file" "cloud_config" {
  content_type = "snippets"
  datastore_id = var.snippets_datastore_id
  node_name    = var.node_name

  source_raw {
    data      = var.cloudinit_userdata
    file_name = "${var.name}-cloud-config.yaml"
  }
}

resource "proxmox_virtual_environment_vm" "this" {
  name      = var.name
  node_name = var.node_name
  tags      = var.tags

  clone {
    vm_id = var.template_id
  }

  cpu {
    cores = var.cores
    type  = "host"
  }

  memory {
    dedicated = var.memory_mb
  }

  disk {
    interface    = "scsi0"
    datastore_id = var.datastore_id
    size         = var.disk_gb
  }

  network_device {
    bridge = var.network_bridge
    model  = "virtio"
  }

  agent {
    enabled = true
    timeout = "2m"
  }

  initialization {
    datastore_id      = var.datastore_id
    user_data_file_id = proxmox_virtual_environment_file.cloud_config.id
  }

  lifecycle {
    ignore_changes = [
      initialization
    ]
  }
}
