{ self, inputs, ... }:
let
  system = "x86_64-linux";
  pkgs = import inputs.nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
in {
  flake.homeConfigurations.nestor-wsl = inputs.home-manager.lib.homeManagerConfiguration {
    inherit pkgs;
    extraSpecialArgs = {
      inherit inputs self;
    };
    modules = [
      self.homeModules.common
      ../../_home/vscode.nix
      {
        home.username = "nestor";
        home.homeDirectory = "/home/nestor";
        targets.genericLinux.enable = true;

        programs.git = {
          settings.user = {
            email = "nes.manrique@gmail.com";
            name = "nestor.manrique";
          };

          # 1Password's SSH agent runs on Windows. Git inside WSL delegates
          # SSH requests to Windows OpenSSH, which then requests authorization
          # from 1Password.
          settings.core.sshCommand = "/mnt/c/Windows/System32/OpenSSH/ssh.exe";
        };

        # Put a transparent `ssh` wrapper ahead of the Linux OpenSSH client.
        # `home.sessionPath` already places ~/.local/bin first in PATH.
        home.file.".local/bin/ssh" = {
          source = pkgs.writeShellScript "ssh" ''
            exec /mnt/c/Windows/System32/OpenSSH/ssh.exe "$@"
          '';
          executable = true;
        };
      }
    ];
  };
}
