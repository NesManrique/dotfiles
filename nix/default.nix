let
  # Import the nixpkgs
  pkgs = import <nixpkgs> {};

  # Import home-manager
  home-manager = import (pkgs.fetchFromGitHub {
    owner = "nix-community";
    repo = "home-manager";
    rev = "release-23.05"; # Update the revision as necessary
    sha256 = "gSg7UTVtls2yO9lKtP0yb66XBHT1Fx5qZSZbGMpSn2c="; # You need to find the correct hash for the given revision
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
  homeDirectory = "/home/<your-username>"; # Replace with your username
  username = "<your-username>"; # Replace with your username
}

