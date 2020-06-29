bootstrap-expect = 3
server = true
retry-join = "provider=digitalocean region=ams3 tag_name=nomad api_token=API_TOKEN"
bind = "{{ GetAllInterfaces | include \"network\" \"10.110.0.0/24\" | attr \"address\" }}"
data-dir = "/home/nomaduser/.consul/data"