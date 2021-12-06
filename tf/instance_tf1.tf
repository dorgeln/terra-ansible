resource "openstack_compute_keypair_v2" "terrabuilder" {
  provider   = openstack.ovh # Provider name declared in provider.tf
  name       = "terrabuilder" # Name of the SSH key to use for creation
  public_key = file("~/.ssh/id_rsa.pub") # Path to your previously generated SSH key
}
resource "openstack_compute_instance_v2" "fb-4ab82110-4ad8-4647-a8de-d07867bcc39f" {
  name        = "feedstock_linux_64_cuda_compiler_version10.2cudnn7python3.7.____cpython"
  provider    = openstack.ovh  # Provider name
  image_name  = "Baremetal - Ubuntu 20.04" # Image name
  flavor_name = "metal.eg-32" # Instance type name
  metadata = {
    ansible_group = "terrabuilder"
    ansible_user = "ubuntu"
  }
  # Name of openstack_compute_keypair_v2 resource named keypair_test
  key_pair    = openstack_compute_keypair_v2.terrabuilder.name
  network {
    name      = "Ext-Net-Baremetal" # Adds the network component to reach your instance
  }
}
