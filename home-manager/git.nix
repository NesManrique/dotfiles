{ pkgs, ... }:

{
  home.packages = with pkgs; [ lazygit ];

  home.file."gitignore" = {
    text = ''
      tags
      .DS_Store
    '';
    target = ".gitignore";
  };

  programs.git = {
    enable = true;
    userName = "Nestor Manrique";
    userEmail = "nes.manrique@gmail.com";

    extraConfig = {
      core = {
        excludesFile = "~/.gitignore";
        editor = "nvim";
      };
      pull = { rebase = false; };
      push = {
        # saves you from git push --set-upstream origin my-branch
        default = "current";
      };
      # git records how hunk conflicts where resolved so it can 
      # resolve them automatically next time
      rerere = { enabled = true; };
      url = { "ssh://git@github.com" = { insteadOf = "https://github.com"; }; };
    };
  };

}
