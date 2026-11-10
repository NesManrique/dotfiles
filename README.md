# dotfiles

Cross-platform dotfiles and developer environment configuration managed with
Nix.

## Layout

- `modules/_home/`: reusable Home Manager feature modules shared across hosts
- `modules/home-modules.nix`: central flake export for shared Home Manager
  modules
- `modules/hosts/ubuntu-wsl/`: the active Ubuntu 24.04 WSL Home Manager target
- `modules/hosts/work-macos/`: placeholder nix-darwin host slot for the future
- `config-files/`: source-managed dotfiles reused by features
- `legacy-nix/`: previous Nix setup kept as migration reference

## Ubuntu WSL bootstrap

Run the bootstrap script from the repo root:

```bash
./scripts/bootstrap.sh
```

The script installs Nix if needed, enables flakes for the user, installs the
configuration using an existing `home-manager` command when available, and
otherwise falls back to `nix run`, then applies the `nestor-wsl`
configuration.

## Daily usage

Apply the current configuration:

```bash
home-manager switch --flake .#nestor-wsl
```

Inspect what the flake exports:

```bash
nix flake show
```

## Global Tooling Defaults

### Codex CLI

Codex comes from a separate `nixpkgs-codex` input pinned to revision
`16b463698a5b9f20881b6c5f1150ce37e2456db9`, providing Codex 0.167.0 with
a cached x86_64-linux binary. Other packages use the main nixpkgs input.
`nixup` preserves this explicit revision; change its URL in `flake.nix` to
upgrade Codex deliberately.

If you installed the npm version, remove it so it does not shadow the Nix binary:

```bash
npm uninstall --global --prefix "$HOME/.local" @openai/codex
```

### Nix-managed tools

The shared workstation profile currently includes:

- `direnv` and `nix-direnv` integration through Home Manager
- Go tooling for quick ad hoc work: `go`, `gopls`, `golangci-lint`, and
  `gotools`
- Nix authoring tools: `nixd` and `alejandra`

Project flakes are still the right place for pinned tool versions or
repo-specific dependencies, but the global profile is meant to be enough for
exploration and small projects without extra scaffolding.

## Notes

- Ubuntu WSL is managed with standalone Home Manager, not NixOS-WSL.
- The shared feature layer is designed to be reused later by a
  `nix-darwin`-based macOS host.
