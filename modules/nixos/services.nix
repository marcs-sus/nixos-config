{
  lib,
  pkgs,
  ...
}:
{
  services = {
    greetd = {
      enable = true;
      useTextGreeter = true;
      settings = {
        default_session = {
          user = "greeter";
          command = lib.getExe' pkgs.tuigreet "tuigreet";
        };
      };
    };

    logind = {
      settings.Login = {
        HandlePowerKey = "ignore";
        HandlePowerKeyLongPress = "poweroff";
      };
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
    };

    openssh.enable = true;
    fail2ban.enable = true;
    gnome.gnome-keyring.enable = true;
    lact.enable = true;
    gvfs.enable = true;
    tumbler.enable = true;
    printing.enable = true;
  };
}
