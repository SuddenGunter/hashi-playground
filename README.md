# nomado
Nomado is my small project of scripts, configs and magic whistles used for running HashiCorp nomad in digitalOcean.

## Dependancies
- terraform
- packer
- POSIX shell

## TODO
- [ ] Forbid root ssh
- [ ] Create VMs in for loop
- [ ] Nomad and consul must be in env of the VM
- [ ] VPC

## How to use
```
    packer build -var-file=packer.vars.json master_template.json
