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
    settings = [
      {
        profile.name = "home_undocked";
        profile.outputs = [
          {
            criteria = "eDP-1";
            scale = 2.0;
            status = "enable";
            position = "0.0";
            mode = "2560x1440@240Hz";
          }
        ];
      }
      {
        profile.name = "home_docked";
        profile.outputs = [
          {
            criteria = "eDP-1";
            scale = 2.0;
            status = "enable";
            position = "0.0";
            mode = "2560x1440@240Hz";
          }
          {
            criteria = "*";
            scale = 2.0;
            status = "enable";
            position = "0.0";
          }
        ];
      }
    ];
  };

  # sway configs
  wayland.windowManager.sway = {
    enable = true;
    systemd.enable = true;
    wrapperFeatures = {gtk = true;};
    config = {
      defaultWorkspace = "workspace 1";
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
        "${mod}+Shift+1" = "move container to workspace 1";
        "${mod}+Shift+2" = "move container to workspace 2";
        "${mod}+Shift+3" = "move container to workspace 3";
        "${mod}+Shift+4" = "move container to workspace 4";
        "${mod}+Shift+5" = "move container to workspace 5";
        "${mod}+Shift+6" = "move container to workspace 6";
        "${mod}+Shift+7" = "move container to workspace 7";
        "${mod}+Shift+8" = "move container to workspace 8";
        "${mod}+Shift+9" = "move container to workspace 9";
        "${mod}+Shift+0" = "move container to workspace 0";
        "${mod}+h" = "focus left";
        "${mod}+l" = "focus right";
        "${mod}+j" = "focus down";
        "${mod}+k" = "focus up";
        "${mod}+Shift+h" = "move left";
        "${mod}+Shift+l" = "move right";
        "${mod}+Shift+j" = "move down";
        "${mod}+Shift+k" = "move up";

        # Controlling sway itself
        "${mod}+Shift+q" = "exit";
        "${mod}+Shift+r" = "exec swaymsg reload";

        # Kill or Toggle Layout
        "${mod}+Shift+x" = "kill";
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
      };
    };
  };
}

