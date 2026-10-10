{
  lib,
  ...
}:
{
  programs = {
    kitty = {
      enable = true;
      enableGitIntegration = true;
      themeFile = "tokyo_night_moon";
      font.name = "MesloLGM Nerd Font Mono";

      settings = {
        confirm_os_window_close = 0;
        dynamic_background_opacity = true;
        background_blur = 5;
        window_padding_width = 10;
        background_opacity = lib.mkForce "0.8";
        enable_audio_bell = false;
        mouse_hide_wait = "-1.0";
        cursor_trail = 1;
      };
    };

    keepassxc = {
      enable = true;
      settings = {
        General = {
          MinimizeAfterUnlock = true;
        };

        Browser = {
          Enabled = true;
          Browser_AllowLocalhostWithPasskeys = true;
          SearchInAllDatabases = true;
        };

        GUI = {
          AdvancedSettings = true;
          MinimizeOnClose = true;
          MinimizeToTray = true;
          ShowTrayIcon = true;
          ApplicationTheme = "dark";
          TrayIconAppearance = "monochrome-dark";
        };

        Security = {
          IconDownloadFallback = true;
        };

        SSHAgent = {
          Enabled = true;
        };
      };
    };

    obsidian.enable = true;
    prismlauncher.enable = true;
  };
}
