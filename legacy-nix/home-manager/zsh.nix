{ config, lib, pkgs, ... }:
let
  pkgsX86 = import <nixpkgs> { localSystem = "x86_64-linux"; };
in
{
  programs.zsh.promptInit = "";
  programs.zsh.enableCompletion = false;

  home-manager.users.nesmanrique = { pkgs, ... }: {

    programs.autojump = {
      enable = true;
      enableZshIntegration = true;
    };

    programs.fzf = {
      enable = true;
    };

    programs.starship = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        add_newline = false;
        format = lib.concatStrings [
          "$all"
        ];
        scan_timeout = 10;
        kubernetes = {
          disabled = false;
        };
        gcloud = {
          disabled = true;
        };
      };
    };

    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    programs.zsh = {
      enable = true;

      autocd = false;

      enableAutosuggestions = true;
      enableCompletion = true;

      oh-my-zsh = {
        enable = true;
        theme = "robbyrussell";

        plugins = [
          "kubectl"
          "git"
          "helm"
          "golang"
          "docker"
        ];
      };

      initExtra = ''
        export PATH=$PATH:~/.local/bin:~/go/bin:~/.cargo/bin

        export NIX_PATH=$NIX_PATH:nixpkgs-overlays=$HOME/.nixpkgs/overlays/
  
        if [ -e /home/nesmanrique/.nix-profile/etc/profile.d/nix.sh ]; then . /home/nesmanrique/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
  
        for FILE in $(ls -1 ~/dotfiles/zsh/zshrc.d/*.sh); do . $FILE; done

        complete -C 'aws_completer' aws
  
        source <(kubectl completion zsh)

      '';
    };
  };
}