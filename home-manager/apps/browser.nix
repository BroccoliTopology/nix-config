{ ... }:

{
  programs = {
    mpv = {
      enable = true;
    };
    spotify-player = {
      enable = true;
    };
  };

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = 1;
  };

}
