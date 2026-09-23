{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    terminal = "tmux-256color";
    keyMode = "vi";
    prefix = "M-j";
    extraConfig = ''
      set -g status-style bg=#FF79C6,fg=black
      set -g status-position top
      set -g allow-passthrough on
      set -ga update-environment TERM
      set -ga update-environment TERM_PROGRAM
    '';
    plugins = with pkgs; [
      tmuxPlugins.open
    ];
  };
}
