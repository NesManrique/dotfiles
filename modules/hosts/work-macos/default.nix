{ ... }: {
  # Future nix-darwin host slot. Intentionally left unbound to a concrete
  # darwinConfiguration until the work-machine details are added.
  flake.darwinModules.work-macos = { ... }: {};
}
