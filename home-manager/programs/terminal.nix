{ ... }:

{
  programs.ghostty = {
    enable = true;
    enableBashIntegration = true;
    installBatSyntax = true;
    installVimSyntax = true;
    settings = {
      theme = "Dracula";
      font-family = "FiraCode Nerd Font";
      font-size = 12;
    };
  };
}
