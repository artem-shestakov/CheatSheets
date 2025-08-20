module "k8s" {
  source  = "../../../Terraform/k8s"
  networks = ["10.10.10.0/24"]

  control_nodes = {
    count = 2
    cpu = 2
    ram = 4
  }
  
  worker_nodes = {
    count = 1
    cpu = 2
    ram = 4
  }

  libvirt_uri = "qemu:///system"
}
