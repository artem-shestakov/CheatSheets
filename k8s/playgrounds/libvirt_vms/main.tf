module "libvirt-vms" {
  source  = "../../../Terraform/libvirt-vms"
  vms = {
    master01 = {
      cpu = 1
      ram = 2
      ip = "10.10.10.2/24"
    },
    worker01 = {
      cpu = 1
      ram = 2
      ip = "10.10.10.11/24"
    }
  }
}
