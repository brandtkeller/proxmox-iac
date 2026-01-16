# Cloud-Init Profiles

This directory contains cloud-init user-data templates used during VM
initialization.

## Design Principles

- All templates are composable
- No branching logic inside templates
- Base profile is always applied
- Overlays are opt-in and role-specific
- cloud-init is first-boot only

## Structure

- `base/` – baseline Ubuntu configuration
- `kubernetes/` – Kubernetes distribution overlays

## Usage

Templates are rendered and concatenated in OpenTofu using `templatefile()`
and passed to the Proxmox VM module as `cloudinit_userdata`.

Changes to these templates require creating new VMs.
