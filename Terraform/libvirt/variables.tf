variable "libvirt_pool_name" {
  description = "A unique name for the resource, required by libvirt"
  default = "libvirt_pool"
}

variable "libvirt_pool_type" {
  description = "A unique name for the resource, required by libvirt"
  default = "dir"
}

variable "libvirt_pool_path" {
  description = "Path to the pool"
  default = "/var/lib/libvirt/images/base"
}

variable "libvirt_volume_name" {
  description = "A unique name for the resource"
  default = "libvirt_volume"
}

variable "libvirt_volume_source" {
  description = "If specified, the image will be uploaded into libvirt storage pool"
  default = "https://cloud-images.ubuntu.com/releases/noble/release/ubuntu-24.04-server-cloudimg-amd64.img"
} 

variable "cloudinit_disk" {
  type = string
  default = "cloudinit_disk"
}
variable "networks" {
  description = "List of networks"
  type = list(string)
  default = []
}
variable "vm_hostname" {
  description = "A unique name of VM"
  default     = "my-vm"
}

variable "ssh_username" {
  description = "The ssh user to use"
  default     = "ssh_username"
}

variable "ssh_private_key" {
  description = "The private key to use"
  default     = "~/.ssh/id_ed25519"
}
