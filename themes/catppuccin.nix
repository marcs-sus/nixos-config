{ pkgs, ... }:
{
  home.packages = with pkgs; [
    papirus-folders
    libsForQt5.qt5ct
  ];

  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "mauve";

    gtk = {
      icon.enable = true;
    };

    cursors = {
      enable = true;
      accent = "dark";
    };

    qt5ct.enable = true;

    kvantum.enable = true;

    hyprland.enable = true;
  };

  gtk = {
    enable = true;

    theme = {
      name = "catppuccin-mocha-mauve-standard";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "mauve" ];
        size = "standard";
        variant = "mocha";
      };
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
      gtk-theme-name = "catppuccin-mocha-mauve-standard";
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
      gtk-theme-name = "catppuccin-mocha-mauve-standard";
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      gtk-theme = "catppuccin-mocha-mauve-standard";
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "kvantum";
  };
}
