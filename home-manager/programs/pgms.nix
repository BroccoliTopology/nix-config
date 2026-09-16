{ pkgs, ... }:

{
  programs = {
    # most of these are just useful cli utils
    yazi.enable = true;
    home-manager.enable = true;
    jq.enable = true;
    fzf.enable = true;
    ripgrep.enable = true;
  };
}
