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
      wallpaper = {
        enabled = true;
        default.path = "/home/marcos/Pictures/Wallpapers";
      };

      shell = {
        launch_apps_as_systemd_services = true;
        niri_overview_type_to_launch_enabled = true;
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
