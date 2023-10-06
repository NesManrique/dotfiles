{ pkgs, ... }:

{
  home.packages = with pkgs; [
    awscli2
    kind
    kubectx
    kubernetes-helm
    terraform
    terraform-lsp
    terragrunt
  ];
}

