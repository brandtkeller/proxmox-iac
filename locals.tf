locals {
  # Standard tags applied to all VMs
  base_tags = [
    "managed-by=opentofu",
    "os=ubuntu"
  ]
}