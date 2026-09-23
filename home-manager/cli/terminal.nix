{ ... }:

{
  programs.ghostty = {
    enable = true;
    enableBashIntegration = true;
    installBatSyntax = true;
    installVimSyntax = true;
    settings = {
      theme = "Dracula";
      # font-family = "FiraCode Nerd Font";
      font-family = "JetBrainsMono Nerd Font Mono";
      font-size = 14;
    };
  };
}
