# terra-builder
Terraform & Ansible integration.

### Init Terraform

```
source ~/openrc.sh
cd tf;terraform init
```

### Apply Terraform configuration

```
ansible-playbook tf_apply.yml
```

### Show Terraform inventory

```
ansible-inventory --playbook-dir . -i tf_inventory.yml --list
```

### Destroy Terraform configuration

```
ansible-playbook tf_destroy.yml
```