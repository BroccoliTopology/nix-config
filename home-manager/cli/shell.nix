{ ... }:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    sessionVariables = {
      NIX_CONFIG = "experimental-features = nix-command flakes";
    };
    shellAliases = {
      yz = "yazi";
      e = "exit";
    };
  };
}
