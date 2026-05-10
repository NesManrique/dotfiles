#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
NIX_CONF_DIR="${HOME}/.config/nix"
NIX_CONF_FILE="${NIX_CONF_DIR}/nix.conf"
export PATH="${HOME}/.nix-profile/bin:/nix/var/nix/profiles/default/bin:${PATH}"

declare -a HOME_MANAGER_CMD

ensure_nix() {
  if command -v nix >/dev/null 2>&1; then
    return
  fi

  sh <(curl -L https://nixos.org/nix/install) --daemon --yes
}

ensure_flakes() {
  mkdir -p "${NIX_CONF_DIR}"

  if [[ ! -f "${NIX_CONF_FILE}" ]] || ! grep -q "experimental-features = nix-command flakes" "${NIX_CONF_FILE}"; then
    printf 'experimental-features = nix-command flakes\n' >> "${NIX_CONF_FILE}"
  fi
}

ensure_home_manager() {
  if command -v home-manager >/dev/null 2>&1; then
    HOME_MANAGER_CMD=(home-manager)
    return
  fi

  HOME_MANAGER_CMD=(nix run github:nix-community/home-manager --)
}

apply_configuration() {
  "${HOME_MANAGER_CMD[@]}" switch -b backup --flake "${ROOT_DIR}#nestor-wsl"
}

ensure_nix
ensure_flakes
ensure_home_manager
apply_configuration
