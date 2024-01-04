#!/bin/bash

# Created new context and set it as default, this asks for api token
# doctl auth init --context personal

# List auth contexts
# doctl auth list

# Switch to a context and make it default
# doctl auth switch --context personal

# Create a new droplet
# https://developers.digitalocean.com/documentation/v2/#create-a-new-droplet

# List images/sizes/regions/ssh-key
# doctl compute image list
# doctl compute size list
# doctl compute region list
# doctl compute ssh-key list

    # --size s-2vcpu-4gb-amd \
    # --size s-1vcpu-2gb-amd \

doctl compute droplet create \
    --image ubuntu-23-10-x64 \
    --size s-1vcpu-1gb-amd \
    --region fra1 \
    --vpc-uuid 9fa1434f-56e3-4d38-afbb-86fb5de44a74 \
    --ssh-keys 34415022 \
    --user-data-file ./dev-env-cloud-config.yml \
    --wait \
    dev-env

# doctl compute ssh --ssh-agent-forwarding --ssh-user nesmanrique --ssh-key-path ~/.ssh/id_rsa dev-env
# doctl compute droplet delete <droplet-id>