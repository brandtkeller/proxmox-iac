# Proxmox OpenTofu Infrastructure

This repository manages virtual machine infrastructure on Proxmox using OpenTofu.

## Design Principles

- Ubuntu cloud images are used as immutable templates
- VM templates are never mutated after creation
- All variability is injected at clone time via cloud-init
- Kubernetes is an overlay, not a separate image
- Environments own intent; modules own mechanics

## Structure

- `modules/` – reusable infrastructure building blocks
- `cloud-init/` – baseline and overlay initialization logic
- `environments/` – environment-specific instantiation
- `packer/` – future golden image builds

## Template Strategy

The default Ubuntu template is referenced by VMID (default: 9000).  
Template promotion is handled by introducing a new template and updating configuration, not mutating existing templates.

## Usage

Initialize from an environment directory:

```bash
cd environments/dev
tofu init
tofu plan
tofu apply
