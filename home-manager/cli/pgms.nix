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

    bat = {
      enable = true;
      themes = {
        dracula = {
          src = pkgs.fetchFromGitHub {
            owner = "dracula";
            repo = "sublime"; # Bat uses sublime syntax for its themes
            rev = "26c57ec282abcaa76e57e055f38432bd827ac34e";
            sha256 = "019hfl4zbn4vm4154hh3bwk6hm7bdxbr1hdww83nabxwjn99ndhv";
          };
          file = "Dracula.tmTheme";
        };
      };
    };
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
