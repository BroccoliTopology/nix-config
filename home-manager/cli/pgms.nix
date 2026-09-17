{ ... }:

{
  programs = {
    # most of these are just useful cli utils
    home-manager.enable = true;
    jq.enable = true;
    fzf.enable = true;
    ripgrep.enable = true;
    yazi = {
      enable = true;
      enableBashIntegration = true;
      settings = {
        mgr = {
          ratio = [ 1 3 4 ];
          show_hidden = true;
        };
      };
    };
  };
}
