#!/bin/bash

install nix
sh <(curl -L https://nixos.org/nix/install) --daemon --yes

git clone git@github.com:NesManrique/dotfiles.git /home/nesmanrique/dotfiles

# Enable flakes
cp dotfiles/nix/nix.conf /etc/nix/nix.conf
sudo systemctl restart nix-daemon

# Copy home-manager flake and config
cp -r dotfiles/nix/home-manager ~/.config/home-manager

# Activate home-manager
nix run home-manager/23.11 -- init --switch

