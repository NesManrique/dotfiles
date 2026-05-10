{ ... }: {
  flake.homeModules = {
    base = ./_home/base.nix;
    cli = ./_home/cli.nix;
    common = ./_home/common.nix;
    git = ./_home/git.nix;
    nvim = ./_home/nvim.nix;
    vim = ./_home/vim.nix;
    zsh = ./_home/zsh.nix;
  };
}
