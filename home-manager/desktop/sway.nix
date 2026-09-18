{
  pkgs,
  lib,
  ...
}:

let
  mod = "Mod4";

in
{
  imports = [
    ./waybar.nix
    ./tofi.nix
  ];

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
            scale = 1.6;
            status = "enable";
            position = "0,0";
            mode = "2560x1440@240Hz";
          }
        ];
      }
      {
        profile.name = "home_docked";
        profile.outputs = [
          {
            criteria = "eDP-1";
            scale = 1.6;
            status = "disable";
            position = "0,0";
            mode = "2560x1440@240Hz";
          }
          {
            criteria = "*";
            scale = 2.0;
            status = "enable";
            position = "2560,0";
            mode = "3840x2160@60Hz";
          }
        ];
      }
    ];
  };

  # sway configs
  wayland.windowManager.sway = {
    enable = true;
    systemd.enable = true;
    wrapperFeatures = {
      gtk = true;
    };
    config = {
      defaultWorkspace = "workspace 0";
      focus.followMouse = false;
      bars = [ ];
      workspaceAutoBackAndForth = true;
      modifier = mod;

      # remove titlebar
      window = {
        titlebar = false;
      };

      # startup
      startup = [
        {
          command = "waybar";
          always = false;
        }
        {
          command = "systemctl --user restart --now kanshi.service";
          always = true;
        }
      ];

      # workspace mappings to monitors
      workspaceOutputAssign =
        (map (n: {
          workspace = toString n;
          output = [
            "HDMI-A-1"
            "eDP-1"
            "DP-1"
            "DP-2"
          ];
        }) (lib.range 0 3))
        ++ (map (n: {
          workspace = toString n;
          output = [
            "DP-1"
            "DP-2"
            "HDMI-A-1"
            "eDP-1"
          ];
        }) (lib.range 4 6))
        ++ (map (n: {
          workspace = toString n;
          output = [
            "DP-2"
            "DP-1"
            "HDMI-A-1"
            "eDP-1"
          ];
        }) (lib.range 7 9));

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
        "${mod}+f" = "fullscreen toggle";

        # Controlling sway itself
        "${mod}+Shift+q" = "exit";
        "${mod}+Shift+r" = "exec swaymsg reload";

        # Volume
        "XF86AudioRaiseVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
        "XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
        "XF86AudioMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";

        # Kill or Toggle Layout
        "${mod}+Shift+x" = "kill";
        "${mod}+w" = "layout tabbed";
        "${mod}+s" = "layout stacking";
        "${mod}+e" = "layout toggle split";
        "${mod}+g" = "split h";
        "${mod}+v" = "split v";

        # Reload kanshi
        "${mod}+m" = "exec --no-startup-id systemctl --user restart --now kanshi.service";

        # Toggle waybar
        "${mod}+Shift+b" = "exec --no-startup-id pkill -SIGUSR1 waybar";

        # Program shortcuts
        "${mod}+Ctrl+l" = "exec ${pkgs.swaylock-fancy}/bin/swaylock-fancy";
        "${mod}+Return" = "exec --no-startup-id ${pkgs.ghostty}/bin/ghostty";
        "${mod}+d" = ''
          exec --no-startup-id tofi-drun --output "$(swaymsg -t get_outputs -r | jq -r '.[] | select(.focused).name')" --drun-launch=true
        '';
        "--release Print" =
          ''exec --no-startup-id sh -c 'grim -g "$(slurp)" "$XDG_SCREENSHOTS_DIR/$(date +screenshot_%Y-%m-%d-%H%M%S.png)"' '';
      };
    };
  };
}
