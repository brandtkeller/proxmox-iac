terraform {
  backend "local" {}

  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0.93"
    }
  }
}

provider "proxmox" {
  endpoint  = var.proxmox_endpoint
  api_token = var.proxmox_api_token
  insecure  = var.proxmox_insecure

  ssh {
    agent    = true
    username = var.proxmox_ssh_username
  }
}

locals {

  base_tags = [
    "managed-by-opentofu",
    "os-ubuntu",
    "template-9000"
  ]

  vm_name = "dev-node-1"

  cloudinit_userdata = join("\n", compact([
    templatefile("${path.root}/../../cloud-init/base/base.yaml.tftpl", {}),
    var.k8s.enabled ? templatefile(
      "${path.root}/../../cloud-init/kubernetes/${var.k8s.distro}.yaml.tftpl",
      {
        k8s_version = var.k8s.version
      }
    ) : null
  ]))

  tags = concat(
    local.base_tags,
    [
      "environment-dev",
      "role-single-node"
    ]
  )
}

module "dev_vm" {
  source = "../../modules/proxmox-vm"

  providers = {
    proxmox = proxmox
  }

  name        = local.vm_name
  node_name  = var.node_name

  template_id = var.template_id

  cores     = var.cores
  memory_mb = var.memory_mb
  disk_gb   = var.disk_gb

  datastore_id          = var.datastore_id
  snippets_datastore_id = var.snippets_datastore_id
  network_bridge        = var.network_bridge

  cloudinit_userdata = local.cloudinit_userdata
  tags               = local.tags
}
