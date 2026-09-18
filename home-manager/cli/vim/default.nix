{ pkgs, ... }:

let
  vimConfigFiles = [
    ./base.vim
    ./looks.vim
    ./startify.vim
    ./whitespace.vim
    ./fzf.vim
    ./ale.vim
    ./asyncomplete.vim

    # ./snippets/vsnip.vim

    ./vim-lsp/base.vim
    ./vim-lsp/python.vim
    ./vim-lsp/rust.vim
    ./vim-lsp/toml.vim
    ./vim-lsp/vim.vim
  ];
in

{
  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      # Common
      vim-sensible
      fzf-vim

      # Looks
      dracula-vim
      papercolor-theme
      vim-airline
      vim-airline-themes
      vim-startify

      # LSP or linting
      ale
      vim-lsp

      # Snippets
      ultisnips

      # Completion
      asyncomplete-vim
      asyncomplete-lsp-vim
      asyncomplete-ultisnips-vim

      # Utilities
      vim-better-whitespace
      vim-commentary
      vim-surround

      # Languages
      python-syntax
      vim-toml
      rust-vim
    ];
    extraConfig = builtins.concatStringsSep "\n" (map builtins.readFile vimConfigFiles);
  };
}
