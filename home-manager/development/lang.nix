{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # rust
    rustup

    # python
    uv
    python3

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
