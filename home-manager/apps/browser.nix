{ pkgs, ... }:

{
  programs = {
    firefox = {
      enable = true;
    };
  };

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = 1;
  };

  # home.packages = with pkgs; [
  #   google-chrome
  # ];
}
