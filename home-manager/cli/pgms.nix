{ pkgs, ... }:

{
  # pgms that are not home manager programs
  home.packages = with pkgs; [
    ffmpeg
    poppler-utils
  ];

  # pgms that are home manager programs
  programs = {
    # most of these are just useful cli utils
    home-manager.enable = true;
    jq.enable = true;
    fzf.enable = true;
    ripgrep.enable = true;
    asciinema.enable = true;
    yt-dlp.enable = true;

    eza = {
      enable = true;
      enableBashIntegration = true;
    };
    zoxide = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}
