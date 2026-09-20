{ ... }:

{
  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
    settings = {

      # set file preview panel view
      mgr = {
        ratio = [
          1
          3
          4
        ];
        show_hidden = true;
      };

      # set openers for different file types
      opener = {
        play_video = [
          {
            desc = "Play video";
            run = ''mpv "$@"'';
            orphan = true;
            block = false;
          }
        ];
        edit = [
          {
            desc = "Edit with text editor";
            run = "$EDITOR %s";
            block = true;
          }
        ];
        view_pdf = [
          {
            desc = "View pdf";
            run = "zathura %s";
            orphan = true;
            block = false;
          }
        ];
      };

      # set file open rules
      open = {
        prepend_rules = [
          {
            mime = "video/*";
            use = "play_video";
          }
          {
            mime = "application/pdf";
            use = "view_pdf";
          }
        ];
      };
    };
  };
}
