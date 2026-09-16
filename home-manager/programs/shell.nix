{ ... }:

{
  programs = {
    home-manager.enable = true;
    jq.enable = true;
    yazi.enable = true;
    bash = {
      enable = true;
      enableCompletion = true;
      sessionVariables = {
        NIX_CONFIG = "experimental-features = nix-command flakes";
      };
    };
  };
}
