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
        };
      }
    ];
  };
}
