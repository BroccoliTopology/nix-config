{
  pkgs,
  ...
}:
let mod = "Mod4";
in {
  # widgets
  programs = {
    wofi = {
      enable = true;
      settings = {
        allow_markup = true;
        width = 250;
      };
    };
    waybar = {
      enable = true;
      systemd.enable = true;
    };
  };

  # Additional services
  services.cliphist.enable = true;

  # Controls monitor outputs
  services.kanshi = {
    enable = true;
    profiles = {
      home_offic = {
        outputs = [
          {
            criteria = "eDP-1";
            scale = 1.0;
            status = "enable";
            position = "0.0";
          }
        ];
      };
    };
  };

  # sway configs
  wayland.windowManager.sway = {
    enable = true;
    systemd.enable = true;
    wrapperFeatures = {gtk = true;};
    config = {
      focus.followMouse = true;
      workspaceAutoBackAndForth = true;
      modifier = mod;
      keybindings = {

        # Workspaces and Windows
        "${mod}+1" = "workspace 1";
        "${mod}+2" = "workspace 2";
        "${mod}+3" = "workspace 3";
        "${mod}+4" = "workspace 4";
        "${mod}+5" = "workspace 5";
        "${mod}+6" = "workspace 6";
        "${mod}+7" = "workspace 7";
        "${mod}+8" = "workspace 8";
        "${mod}+9" = "workspace 9";
        "${mod}+0" = "workspace 0";
        "${mod}+Ctrl+1" = "move container to workspace 1";
        "${mod}+Ctrl+2" = "move container to workspace 2";
        "${mod}+Ctrl+3" = "move container to workspace 3";
        "${mod}+Ctrl+4" = "move container to workspace 4";
        "${mod}+Ctrl+5" = "move container to workspace 5";
        "${mod}+Ctrl+6" = "move container to workspace 6";
        "${mod}+Ctrl+7" = "move container to workspace 7";
        "${mod}+Ctrl+8" = "move container to workspace 8";
        "${mod}+Ctrl+9" = "move container to workspace 9";
        "${mod}+Ctrl+0" = "move container to workspace 0";
        "${mod}+h" = "focus left";
        "${mod}+l" = "focus right";
        "${mod}+j" = "focus down";
        "${mod}+k" = "focus up";
        "${mod}+Ctrl+h" = "move left";
        "${mod}+Ctrl+l" = "move right";
        "${mod}+Ctrl+j" = "move down";
        "${mod}+Ctrl+k" = "move up";

        # Kill or Toggle Layout
        "${mod}+Ctrl+x" = "kill";
        "${mod}+w" = "layout tabbed";
        "${mod}+s" = "layout stacking";
        "${mod}+e" = "layout toggle split";
        "${mod}+g" = "split h";
        "${mod}+v" = "split v";

        # Program shortcuts
        "${mod}+Ctrl+l" = "exec ${pkgs.swaylock-fancy}/bin/swaylock-fancy";
        "--release Print" = "exec --no-startup-id ${pkgs.sway-contrib.grimshot}/bin/grimshot copy area";
        "${mod}+Return" = "exec --no-startup-id ${pkgs.ghostty}/bin/ghostty";
        "${mod}+space" = "exec --no-startup-id wofi --show drun,run";

        # Controlling sway itself
        "${mod}+Ctrl+q" = "exit";
        "${mod}+Shift+r" = "exec swaymsg reload";
      };
    };
  };
}

