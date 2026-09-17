{ ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";

        modules-left = [
          "sway/workspaces"
        ];

        modules-center = [
          "clock"
          # "custom/weather"
        ];

        modules-right = [
          "pulseaudio"
          "custom/uptime"
          # "backlight"
          "battery"
          "network"
          "cpu"
          "memory"
          # "custom/docker"
          "tray"
          # "custom/lock"
          "custom/power"
        ];

        "sway/workspaces" = {
          format = "{name}: {icon}";
          format-icons = {
            default = "";
            focused = "";
          };
        };

        "battery" = {
          "interval" = 30;
          "states" = {
            "good" = 95;
            "warning" = 30;
            "critical" = 15;
          };
          "format" = "{icon} {capacity}%";
          "format-icons" = [
            ""
            ""
            ""
            ""
            ""
          ];
        };

        tray = {
          icon-size = 16;
          spacing = 10;
        };

        "custom/music" = {
          format = "  {}";
          escape = true;
          interval = 5;
          tooltip = false;
          exec = "playerctl metadata --format='{{ artist }} - {{ title }}'";
          on-click = "playerctl play-pause";
          max-length = 50;
        };

        clock = {
          timezone = "America/New_York";
          tooltip-format =
            "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format = "{:%d/%m/%Y - %H:%M:%S}";
          interval = 1;
        };

        network = {
          format-wifi = "󰤢 {bandwidthDownBits}";
          format-ethernet = "󰈀 {bandwidthDownBits}";
          format-disconnected = "󰤠 No Network";
          interval = 5;
          tooltip = false;
        };

        cpu = {
          interval = 1;
          format = "  {icon0}{icon1}{icon2}{icon3} {usage:>2}%";
          format-icons = [
            "▁"
            "▂"
            "▃"
            "▄"
            "▅"
            "▆"
            "▇"
            "█"
          ];
        };

        memory = {
          interval = 30;
          format = "  {used:0.1f}G/{total:0.1f}G";
        };

        "custom/uptime" = {
          format = "{}";
          interval = 1600;
          exec = "sh -c '(uptime -p)'";
        };

        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = "";

          format-icons = {
            default = [
              ""
              ""
              " "
            ];
          };

          on-click = "pavucontrol";
        };

        "custom/power" = {
          tooltip = false;
          on-click = "wlogout &";
          format = "⏻";
        };
      };
    };
    style = ''
      * {
        font-family: Hack Nerd Font Propo;
        font-size: 16px;
        min-height: 0;
        padding-right: 2px;
        padding-left: 2px;
        padding-bottom: 0px;
      }

      #waybar {
        background: transparent;
        color: #c6d0f5;
        margin: 2px 2px;
      }

      #workspaces {
        border-radius: 5px;
        margin: 5px;
        background: #101010;
        margin-left: 2px;
      }

      #workspaces button {
        color: #babbf1;
        border-radius: 5px;
        padding: 0.4rem;
      }

      #workspaces button.active {
        color: #99d1db;
        border-radius: 5px;
      }

      button {
        background: transparent;
      }

      #workspaces button:hover {
        background: #1e1e1e;
        border: 0px solid transparent;
      }

      #custom-music,
      #tray,
      #backlight,
      #clock,
      #battery,
      #pulseaudio,
      #network,
      #cpu,
      #memory,
      #custom-lock,
      #custom-power,
      #custom-weather,
      #custom-uptime,
      #custom-docker {
        background-color: #101010;
        padding: 0.5rem 1rem;
        margin: 5px 0;
      }

      #clock {
        color: #8caaee;
        border-radius: 5px;
      }

      #custom-weather {
        color: #8caaee;
        margin-left: 0.5rem;
        border-radius: 5px;
      }

      #battery {
        color: #a6d189;
      }

      #battery.charging {
        color: #a6d189;
      }

      #battery.warning:not(.charging) {
        color: #e78284;
      }

      #backlight {
        color: #e5c890;
      }

      #backlight,
      #battery {
        border-radius: 0;
      }

      #pulseaudio {
        color: #ea999c;
        border-radius: 5px 0px 0px 5px;
      }

      #custom-docker {
        color: #85c1dc;
      }

      #custom-music {
        color: #ca9ee6;
        border-radius: 5px;
      }

      #custom-lock {
        color: #babbf1;
      }

      #custom-power {
        margin-right: 1rem;
        border-radius: 0px 5px 5px 0px;
        color: #e78284;
      }

      #custom-docker.docker {
        color: #85c1dc;
      }

      #custom-docker.docker-none {
        color: #737994;
      }

      #custom-docker.docker-error {
        color: #e78284;
      }

      #custom-weather.clear {
        color: #e5c890;
      }

      #custom-weather.cloud {
        color: #99d1db;
      }

      #custom-weather.rain {
        color: #8caaee;
      }

      #custom-weather.snow {
        color: #c6d0f5;
      }

      #custom-weather.thunder {
        color: #ca9ee6;
      }

      #custom-weather.fog {
        color: #b0b4bc;
      }

      #custom-weather.error {
        color: #e78284;
      }
    '';
  };
}


