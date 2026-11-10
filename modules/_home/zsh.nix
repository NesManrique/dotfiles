{ config, lib, ... }: {
  programs.autojump = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.fzf.enable = true;

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      scan_timeout = 10;
      kubernetes.disabled = false;
      gcloud.disabled = true;
    };
  };

  programs.zsh = {
    enable = true;
    autocd = false;
    dotDir = config.home.homeDirectory;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      nixswitch = "home-manager switch --flake .#nestor-wsl";
      nixup = "(cd ~/myrepos/dotfiles && nix flake update && home-manager switch --flake .#nestor-wsl)";
      zshconfig = "nvim ~/.zshrc";
    };
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "docker"
        "git"
        "golang"
        "helm"
        "kubectl"
      ];
    };
    initContent = lib.concatStringsSep "\n" [
      "export PATH=\"$HOME/bin:/usr/local/bin:$PATH\""
      ""
      "if (( $+commands[aws_completer] )); then"
      "  complete -C aws_completer aws"
      "fi"
      ""
      "if (( $+commands[kubectl] )); then"
      "  source <(kubectl completion zsh)"
      "fi"
    ];
  };
}
