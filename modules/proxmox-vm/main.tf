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
    interface = "scsi0"
    datastore_id = var.datastore_id
    size      = "${var.disk_gb}G"
  }

  network_device {
    bridge = var.network_bridge
    model  = "virtio"
  }

  agent {
    enabled = true
  }

  initialization {
    user_data = var.cloudinit_userdata
  }

  lifecycle {
    ignore_changes = [
      initialization[0].user_data
    ]
  }
}
