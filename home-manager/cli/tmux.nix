{ ... }:

{
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    prefix = "M-j";
    extraConfig = ''
      set -g status-style bg=#FF79C6,fg=black
    '';
  };
}
