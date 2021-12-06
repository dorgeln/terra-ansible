# terra-builder
Conda-Forge package builder for Terraform &amp; Ansible.

ansible-galaxy collection install community.general

cd terra

provider.tf
terraform {
required_version    = ">= 0.14.0" # Takes into account Terraform versions from 0.14.0
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.42.0"
    }

    ovh = {
      source  = "ovh/ovh"
      version = ">= 0.13.0"
    }
  }
}

source ~/openrc.sh
terraform init

ansible-inventory tf_inventory.yml --list
ansible-inventory --playbook-dir ./ -i tf_inventory.yml --list -vvv
terraform show -json