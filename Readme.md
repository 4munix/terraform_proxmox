# Prerequesites

* terraform
* packer
* pvetui

# Install

## MacOS

```bash
brew tap hashicorp/tap && \
    brew install hashicorp/tap/packer \
    hashicorp/tap/terraform \
    pvetui
```

# Creating the Proxmox user and role for terraform

[terraform docs](https://registry.terraform.io/providers/Terraform-for-Proxmox/proxmox/latest/docs)

## Create role

```bash
pveum role add TerraformProv -privs "Datastore.AllocateSpace \
    Datastore.Audit \
    Pool.Allocate \
    Sys.Audit \
    Sys.Console \
    Sys.Modify \
    VM.Allocate \
    VM.Audit \
    VM.Clone \
    VM.Config.CDROM \
    VM.Config.Cloudinit \
    VM.Config.CPU \
    VM.Config.Disk \
    VM.Config.HWType \
    VM.Config.Memory \
    VM.Config.Network \
    VM.Config.Options \
    VM.Migrate \
    VM.PowerMgmt \
    SDN.Use \
    VM.GuestAgent.Audit \
    VM.GuestAgent.Unrestricted"
```

## Create user with password

```bash
pveum user add terraform-prov@pve --password <password>
```

## Add user to role

```bash
pveum aclmod / -user terraform-prov@pve -role TerraformProv
```
