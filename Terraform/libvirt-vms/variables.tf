variable "project_name" {
  type = string
  description = "The name of project"
  default = "libvirt_vms_project"
}
variable "libvirt_uri" {
  type = string
  default = "qemu:///system"
}

variable "vms" {
  type = map(object({
    cpu = number,
    ram = number,
    ip = string
  }))
}

# variable "libvirt_pool_name" {
#   description = "A unique name for the resource, required by libvirt"
#   default = "libvirt_pool"
# }

variable "libvirt_pool_type" {
  description = "Type of libvirt pool"
  default = "dir"
}

variable "libvirt_pool_path" {
  description = "Path to the pool"
  default = "/var/lib/libvirt/images"
}

variable "libvirt_volume_source" {
  description = "If specified, the image will be uploaded into libvirt storage pool"
  default = "https://cloud-images.ubuntu.com/releases/noble/release/ubuntu-24.04-server-cloudimg-amd64.img"
} 

variable "network" {
  description = "List of networks"
  type = string
  default = "10.10.10.0/24"
}
variable "vm_hostname" {
  description = "A unique name of VM"
  default     = "my-vm"
}

variable "ssh_username" {
  description = "The ssh user to use"
  default     = "ubuntu"
}

variable "ssh_private_key" {
  description = "The private key to use"
  default     = "~/.ssh/id_ed25519"
}
