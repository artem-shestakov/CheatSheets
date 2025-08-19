module "vms" {
  source  = "../../../Terraform/k8s"
  masters = 1
  nodes   = 1

  libvirt_uri = "qemu:///system"
}
