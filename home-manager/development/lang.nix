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
    taplo

    # go
    go
    gopls

    # hashilang
    terraform-ls

    # scala
    # scala
    # scalafmt
    # jdk17
    # sbt
    # coursier
    # bloop
    # metals
  ];

  programs = {
    gcc = {
      enable = true;
    };
  };
}
