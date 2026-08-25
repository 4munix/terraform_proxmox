# main.tf
# vim: se ft=bash sw=2 sts=2:

provider "proxmox" {
  endpoint = var.endpoint
  api_token = var.proxmox_api_token
  insecure = var.insecure_endpoint
}

resource "proxmox_virtual_environment_vm" "ubuntu" {
  name      = var.vm_name
  node_name = var.node_name

  clone {
    vm_id = var.vm_id_template
  }

  description = var.resource_description

  started = true

  stop_on_destroy = true

  cpu {
    cores = var.cores
  }

  memory {
    dedicated = var.memory
  }

  disk {
    interface     = "scsi0"
    datastore_id  = "local-lvm"
    size          = var.disk_size
  }

  network_device {
    bridge = "vmbr0"
  }

  initialization {
    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }

    user_account {
      username = "root"

      keys = [
        file("~/.ssh/id_ed25519.pub")
      ]
    }
  }
}

