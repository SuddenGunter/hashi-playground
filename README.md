# What

This repo is my small project of scripts, configs and dark magic used for running HashiCorp Nomad cluster in DigitalOcean.
It's not ready even for base use cases at the moment.

## Dependencies if you want to run it

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
- [ ] Firewall on VM

## How to use

```
    packer build -var-file=packer.vars.json master_template.json
    # add image id to tfvars.json
    terraform apply

    # then on each node
    # for server
    consul agent -bootstrap-expect 1 -server -retry-join "provider=digitalocean region=ams3 tag_name=nomad api_token=API_TOKEN_HERE" -bind '{{ GetAllInterfaces | include "network" "10.110.0.0/24" | attr "address" }}'  -data-dir /home/USERNAME/.consul/

    # for client:
    consul agent  -retry-join "provider=digitalocean region=ams3 tag_name=nomad api_token=API_TOKEN_HERE" -bind '{{ GetAllInterfaces | include "network" "10.110.0.0/24" | attr "address" }}'  -data-dir /home/USERNAME/.consul/

```
