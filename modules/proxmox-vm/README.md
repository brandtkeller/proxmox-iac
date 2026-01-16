# Proxmox VM Module

This module clones a virtual machine from an existing Proxmox template and injects
cloud-init user-data at first boot.

## Responsibilities

- Clone from an immutable template
- Configure CPU, memory, disk, and networking
- Inject cloud-init user-data
- Expose VM identifiers and IP addresses

## Non-Responsibilities

- OS configuration beyond cloud-init
- Kubernetes installation or management
- Template lifecycle management

## Lifecycle Notes

- cloud-init runs once at first boot
- Changes to cloud-init require new VMs
- This module intentionally ignores user-data drift
