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

    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
    };

    openssh.enable = true;

    gnome.gnome-keyring.enable = true;

    gvfs.enable = true;

    tumbler.enable = true;

    printing.enable = true;
  };
}
