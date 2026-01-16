node_name    = "pve01"
template_id = 9000

datastore_id = "local-btrfs"

cores     = 4
memory_mb = 8192
disk_gb   = 50

k8s = {
  enabled = false
  distro  = "k3s"
  version = "v1.29.1+k3s1"
}
