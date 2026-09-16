{ ... }:

{
  programs.ghostty = {
    enable = true;
    enableBashIntegration = true;
    installBatSyntax = true;
    installVimSyntax = true;
    settings = {
      theme = "Dracula+";
    };
  };
}
