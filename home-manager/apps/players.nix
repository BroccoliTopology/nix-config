{ pkgs, ... }:

{
  home.packages = with pkgs; [
    spotify
  ];
  programs = {
    mpv = {
      enable = true;
    };
    spotify-player = {
      enable = true;
    };
  };
}
