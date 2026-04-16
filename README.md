# NHS Azure Web Infrastructure - Terraform

## Overview
This project deploys an isolated Azure environment for a public-facing web server using Terraform.

## Architecture
- Dedicated Resource Group
- Dedicated Virtual Network and private web subnet
- Network Security Group with restricted inbound rules
- NAT Gateway for explicit outbound internet access
- Azure Standard Public Load Balancer for inbound web traffic
- Inbound NAT rule for SSH administration from a trusted public IP only
- Ubuntu Linux VM (Standard_B2s) with Nginx installed using cloud-init

## Security measures
- No public IP on the VM
- SSH key-based authentication only
- SSH restricted to a specific public IP
- Minimal inbound NSG rules
- Automatic OS updates enabled

## Prerequisites
- Azure subscription
- Terraform installed
- Azure CLI installed
- Existing SSH key pair
- Pre-created Azure Storage account/container for Terraform remote state

## Backend setup
Copy the example backend file and populate it with your real backend values:

```bash
cp backend.hcl.example backend.hcl
