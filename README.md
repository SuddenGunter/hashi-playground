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
- [ ] Set tag on VMs so consul autodiscovery can work correctly
- [ ] Autostart consul and nomad
- [ ] Firewall on VM?

## How to use
```
    packer build -var-file=packer.vars.json master_template.json
    #add image id to tfvars.json
    terraform apply
    #then on each node
    consul agent -retry-join "provider=digitalocean region=ams3 tag_name=nomad api_token=DO_TOKEN"  -bind 'ip?'  -data-dir /home/nomaduser/.consul/
```