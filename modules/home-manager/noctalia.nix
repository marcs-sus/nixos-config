{
  inputs,
  ...
}:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia = {
    enable = true;
    systemd.enable = true;

    settings = {
      shell = {
        launch_apps_as_systemd_services = true;
        niri_overview_type_to_launch_enabled = true;
        clipboard_auto_paste = "off";
      };

      bar.default = {
        margin_ends = 50;
        widget_spacing = 10;

        start = [
          "workspaces"
        ];
        center = [
          "clock"
        ];
        end = [
          "media"
          "tray"
          "notifications"
          "bluetooth"
          "volume"
          "brightness"
          "battery"
          "wallpaper"
          "control-center"
        ];
      };

      control_center = {
        width = 1200;
        hidden_tabs = [
          "power"
          "network"
        ];

        shortcuts = [
          { type = "bluetooth"; }
          { type = "caffeine"; }
          { type = "nightlight"; }
          { type = "notification"; }
          { type = "wallpaper"; }
          { type = "session"; }
        ];
      };

      wallpaper = {
        directory = "/home/marcos/Pictures/Wallpapers";
      };

      theme = {
        mode = "dark";
        shell_mode = "dark";
      };

      audio = {
        enable_sounds = true;
        sound_volume = 0.2;
        sound_theme = "freedesktop";
      };

      idle = {
        pre_action_fade_seconds = 2.0;

        behavior_order = [
          "screen-off"
          "suspend"
        ];

        behavior = {
          screen-off = {
            enabled = true;
            timeout = 600;
            action = "screen_off";
          };

          suspend = {
            enabled = true;
            timeout = 1200;
            action = "suspend";
          };
        };
      };

      location = {
        auto_locate = true;
      };

      nightlight = {
        enabled = true;
        temperature_day = 6500;
        temperature_night = 4000;
      };

      plugins = {
        auto_update = "all";

        enabled = [
          "blackbartblues/audio-switcher"
        ];

        source = [
          {
            name = "official";
            kind = "git";
            location = "https://github.com/noctalia-dev/official-plugins";
            enabled = true;
          }

          {
            name = "community";
            kind = "git";
            location = "https://github.com/noctalia-dev/community-plugins";
            enabled = true;
          }
        ];
      };
    };
  };
}
