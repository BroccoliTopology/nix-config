{ ... }:

{
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
