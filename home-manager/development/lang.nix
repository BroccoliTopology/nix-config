{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # rust
    rustup

    # python
    uv

    # nix
    nixfmt
    statix

    # vim
    vim-language-server

    # go
    go
    gopls
  ];
  programs = {
    gcc = {
      enable = true;
    };
  };
}
