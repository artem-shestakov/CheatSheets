locals {
  project = basename(abspath(path.module))
  pool_name = "pool_${local.project}"
}

resource "libvirt_pool" "pool" {
  name = local.pool_name
  type = var.libvirt_pool_type
  target {
    path = "${var.libvirt_pool_path}/${local.pool_name}/pool"
  }
}

resource "libvirt_volume" "control_volumes" {
  count = var.control_nodes.count

  name = "volume_control_${count.index}"
  pool = libvirt_pool.pool.name
  source = var.libvirt_volume_source
}

data "template_file" "user_data" {
  template = file("${path.module}/config/cloud_init.yml")
}

data "template_file" "network_config" {
  count = var.control_nodes.count

  template = templatefile("${path.module}/config/network_config.yml", {
    address = "${replace(var.networks[0], "/\\d+\\/\\d+/", "${count.index + 2}/24")}"
    gateway = replace(var.networks[0], "/\\d+\\/\\d+/", "1")
    nameservers = "8.8.8.8"
  })
}

resource "libvirt_cloudinit_disk" "cloudinit_disk" {
  count = var.control_nodes.count

  name           = "cloudinit_disk_control_${count.index}"
  user_data      = data.template_file.user_data.rendered
  network_config = data.template_file.network_config["${count.index}"].rendered
  pool           = libvirt_pool.pool.name
}

resource "libvirt_network" "network" {
  name = "network_${libvirt_pool.pool.name}"

  # mode can be: "nat" (default), "none", "route", "open", "bridge"
  mode = "nat"

  #  the domain used by the DNS server in this network
  domain = ""

  addresses = var.networks
  
  dns {
    enabled = false
    local_only = true
  }

}

resource "libvirt_domain" "control_nodes" {
  count = var.control_nodes.count

  name   = "${local.project}-control-${count.index}"
  memory = var.control_nodes.ram * 1024
  vcpu   = var.control_nodes.cpu

  qemu_agent = true

  cloudinit = libvirt_cloudinit_disk.cloudinit_disk["${count.index}"].id

  network_interface {
    network_name   = libvirt_network.network.name
    wait_for_lease = true
    hostname       = "${local.project}-control-${count.index}"
  }

  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }

  console {
    type        = "pty"
    target_type = "virtio"
    target_port = "1"
  }

  disk {
    volume_id = libvirt_volume.control_volumes["${count.index}"].id
  }

  graphics {
    type        = "spice"
    listen_type = "address"
    autoport    = true
  }
}
