{ ... }: {
  programs.git = {
    enable = true;
    signing.format = null;
    settings = {
      commit.template = "~/.config/git/commit-template";
      core.editor = "nvim";
      core.excludesfile = "~/.config/git/ignore";
      init.defaultBranch = "main";
      pull.rebase = false;
    };
  };

  xdg.configFile."git/commit-template".source = ../../config-files/git/dot.gitcommit;
  xdg.configFile."git/ignore".source = ../../config-files/git/dot.gitignore;
}
