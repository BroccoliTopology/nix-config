{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # slack
    # slack-cli
    zoom-us
    # teams-for-linux
  ];
}
