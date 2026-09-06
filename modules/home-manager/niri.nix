{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.niri.homeModules.niri
  ];

  programs.niri = {
    enable = true;

    settings = {
      input.keyboard.xkb = {
        layout = "br";
        model = "abnt2";
      };

      cursor = {
        xcursor-theme = "Bibata-Modern-Classic";
        xcursor-size = 24;
      };

      spawn-at-startup = [
        { argv = [ "noctalia" ]; }
      ];

      window-rules = [
        {
          matches = [ { app-id = "dev.noctalia.Noctalia"; } ];
          open-floating = true;
          default-column-width = {
            fixed = 1080;
          };
          default-window-height = {
            fixed = 920;
          };
        }
      ];

      binds = {
        "Mod+Space".action.spawn-sh = [ "noctalia msg panel-toggle launcher" ];
        "Mod+S".action.spawn-sh = [ "noctalia msg panel-toggle control-center" ];
        "Mod+Semicolon".action.spawn-sh = [ "noctalia msg settings-toggle" ];
      };
    };
  };
}
