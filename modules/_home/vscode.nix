{ ... }: {
  home.file.".vscode-server/data/Machine/settings.json".source =
    ../../config-files/vscode/settings.json;

  home.file.".vscode-server/data/Machine/keybindings.json".source =
    ../../config-files/vscode/keybindings.json;
}
