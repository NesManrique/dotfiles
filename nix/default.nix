let
  # Import the nixpkgs
  pkgs = import <nixpkgs> {};

  # Import home-manager
  home-manager = import (pkgs.fetchFromGitHub {
    owner = "nix-community";
    repo = "home-manager";
    rev = "release-23.05"; # Update the revision as necessary
    sha256 = "Lxmjez0nfNBptdqV5GsXKm7Bb7swjGsrxiLxWJu0tL8="; # You need to find the correct hash for the given revision
  }) {};

in
home-manager.lib.homeManagerConfiguration {
  configuration = { pkgs, ... }: {
    home.packages = with pkgs; [
      awscli2
      kind
      kubectx
      kubernetes-helm
      terraform
      terraform-lsp
      terragrunt
    ];
  };
  system = "x86_64-linux";
  homeDirectory = "/home/nesmanrique"; # Replace with your username
  username = "nesmanrique"; # Replace with your username
}

{
  description = "My personal flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-23.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, home-manager, flake-utils, ... }: flake-utils.lib.eachSystem [ "x86_64-linux" ] (system:
    let
      pkgs = import nixpkgs {
        inherit system;
        config = {};
      };
      homeConfigurations = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        system = system;
        username = "nesmanrique";
        homeDirectory = "/home/nesmanrique";
        configuration = { ... }: {
          home.packages = with pkgs; [
            awscli2
            kind
            kubectx
            kubernetes-helm
            terraform
            terraform-lsp
            terragrunt
          ];
        };
      };
    in
    {
      homeConfigurations = {
        nesmanrique = homeConfigurations;
      };
    });
}
