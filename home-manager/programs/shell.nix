{ ... }:

{
  programs = {
    home-manager.enable = true;
    jq.enable = true;
    yazi.enable = true;
    fzf.enable = true;
    ripgrep.enable = true;
    bash = {
      enable = true;
      enableCompletion = true;
      sessionVariables = {
        NIX_CONFIG = "experimental-features = nix-command flakes";
      };
      shellAliases = {
        yz = "yazi";
      };
    };
  };
}
