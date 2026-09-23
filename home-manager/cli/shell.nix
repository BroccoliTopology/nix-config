{ ... }:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    sessionVariables = {
      NIX_CONFIG = "experimental-features = nix-command flakes";
    };
    shellAliases = {
      yz = "yazi";
      e = "exit";
      tm = "tmux";
    };
  };
  programs.starship = {
    enable = true;
    presets = [
      "nerd-font-symbols"
      # "gruvbox-rainbow"
      "catppuccin-powerline"
      # "jetpack"
    ];
  };
}
