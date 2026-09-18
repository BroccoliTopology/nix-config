{ pkgs, ... }:

{
  home.packages = with pkgs; [
    rustup
    uv
    nixfmt
    statix
    vim-language-server
  ];
  programs = {
    gcc = {
      enable = true;
    };
  };
}
