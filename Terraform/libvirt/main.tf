resource "libvirt_pool" "pool" {
  name = var.libvirt_pool_name
  type = var.libvirt_pool_type
  target {
    path = "${var.libvirt_pool_path}/${var.libvirt_pool_name}"
  }
}

resource "libvirt_volume" "volume" {
  name = var.libvirt_volume_name
  pool = libvirt_pool.pool.name
  source = var.libvirt_volume_source
}

data "template_file" "user_data" {
  template = file("${path.module}/config/cloud_init.yml")
}

data "template_file" "network_config" {
  template = file("${path.module}/config/network_config.yml")
}

resource "libvirt_cloudinit_disk" "cloudinit_disk" {
  name           = var.cloudinit_disk
  user_data      = data.template_file.user_data.rendered
  network_config = data.template_file.network_config.rendered
  pool           = libvirt_pool.pool.name
}

resource "libvirt_network" "network" {
  name = "${libvirt_pool.pool.name}-net"

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

resource "libvirt_domain" "domain" {
  name   = var.vm_hostname
  memory = "512"
  vcpu   = 1

  cloudinit = libvirt_cloudinit_disk.cloudinit_disk.id

  network_interface {
    network_name   = libvirt_network.network.name
    wait_for_lease = true
    hostname       = var.vm_hostname
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
    volume_id = libvirt_volume.volume.id
  }

  graphics {
    type        = "spice"
    listen_type = "address"
    autoport    = true
  }
}
