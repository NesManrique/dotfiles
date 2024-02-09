#!/bin/bash

#install nix
sh <(curl -L https://nixos.org/nix/install) --daemon --yes

git clone git@github.com:NesManrique/dotfiles.git /home/nesmanrique/dotfiles

# Enable flakes
sudo cp dotfiles/nix/nix.conf /etc/nix/
sudo systemctl restart nix-daemon

# Copy home-manager flake and config
mkdir -p ~/.config/
cp -r dotfiles/nix/home-manager ~/.config/home-manager

# Activate home-manager
nix run home-manager/release-23.11 -- init --switch

# Install docker through here because with nix is a pain in the ass unless you are going with nixos
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh

# Clone other repos
mkdir nhost
git clone git@github.com:nhost/be.git nhost/be

