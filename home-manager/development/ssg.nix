{ pkgs, ... }:

{
  home.packages = with pkgs; [
    netlify-cli
    # zola
  ];
}
