{
  pkgs,
  ...
}:
{
  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
      ];

      config = {
        common.default = [ "gtk" ];
        niri = {
          default = [ "gtk" ];
          "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
        };
      };
    };
  };
}
