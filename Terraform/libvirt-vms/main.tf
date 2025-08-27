locals {
  pool_name = "pool_${var.project_name}"
}

resource "libvirt_pool" "pool" {
  name = local.pool_name
  type = var.libvirt_pool_type
  target {
    path = "${var.libvirt_pool_path}/${local.pool_name}/pool"
  }
}

resource "libvirt_volume" "vms_volumes" {
  for_each = var.vms

  name = "volume_control_${each.key}"
  pool = libvirt_pool.pool.name
  source = var.libvirt_volume_source
}

data "template_file" "user_data" {
  template = file("${path.module}/config/cloud_init.yml")
}

data "template_file" "network_config" {
  for_each = var.vms

  template = templatefile("${path.module}/config/network_config.yml", {
    address = "${each.value.ip}"
    # gateway = replace(var.networks[0], "/\\d+\\/\\d+/", "1")
    gateway = cidrhost(var.networks[0], -2)
    nameservers = "8.8.8.8"
  })
}

resource "libvirt_cloudinit_disk" "cloudinit_disk" {
  for_each = var.vms

  name           = "cloudinit_disk_control_${each.key}"
  user_data      = data.template_file.user_data.rendered
  network_config = data.template_file.network_config["${each.key}"].rendered
  pool           = libvirt_pool.pool.name
}

resource "libvirt_network" "network" {
  name = "network_${libvirt_pool.pool.name}"

  # mode can be: "nat" (default), "none", "route", "open", "bridge"
  mode = "nat"

  #  the domain used by the DNS server in this network
  domain = ""

  addresses = [var.network]
  
  dns {
    enabled = false
    local_only = true
  }

}

resource "libvirt_domain" "control_nodes" {
  for_each = var.vms

  name   = "${each.key}"
  vcpu   = each.value.cpu
  memory = each.value.ram * 1024

  qemu_agent = true

  cloudinit = libvirt_cloudinit_disk.cloudinit_disk["${each.key}"].id

  network_interface {
    network_name   = libvirt_network.network.name
    # wait_for_lease = true
    # hostname       = "${local.project}-control-${count.index}"
    # addresses      = ["${replace(var.networks[0], "/\\d+\\/\\d+/", "${count.index + 2}")}"]
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
    volume_id = libvirt_volume.vms_volumes["${each.key}"].id
  }

  graphics {
    type        = "spice"
    listen_type = "address"
    autoport    = true
  }
}
