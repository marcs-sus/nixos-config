{
  ...
}:
{
  programs = {
    kitty = {
      enable = true;
      enableGitIntegration = true;
      themeFile = "tokyo_night_moon";
      font.name = "MesloLGM Nerd Font Mono";
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
