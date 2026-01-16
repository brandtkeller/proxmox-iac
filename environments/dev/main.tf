terraform {
  backend "local" {}
}

locals {
  vm_name = "dev-node-1"

  cloudinit_userdata = join("\n", compact([
    templatefile("${path.root}/cloud-init/base/base.yaml.tftpl", {}),
    var.k8s.enabled ? templatefile(
      "${path.root}/cloud-init/kubernetes/${var.k8s.distro}.yaml.tftpl",
      {
        k8s_version = var.k8s.version
      }
    ) : null
  ]))

  tags = concat(
    local.base_tags,
    [
      "environment=dev",
      "role=single-node"
    ]
  )
}

module "dev_vm" {
  source = "../../modules/proxmox-vm"

  name        = local.vm_name
  node_name  = var.node_name

  template_id = var.template_id

  cores     = var.cores
  memory_mb = var.memory_mb
  disk_gb   = var.disk_gb

  datastore_id   = var.datastore_id
  network_bridge = var.network_bridge

  cloudinit_userdata = local.cloudinit_userdata
  tags               = local.tags
}
