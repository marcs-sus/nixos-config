{
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/default.nix
  ];

  # Temporary overlay `libdisplay-info_0_2` has been removed
  nixpkgs.overlays = [
    (final: prev: {
      libdisplay-info_0_2 = prev.libdisplay-info.overrideAttrs (old: rec {
        version = "0.2.0";
        src = final.fetchFromGitLab {
          domain = "gitlab.freedesktop.org";
          owner = "emersion";
          repo = "libdisplay-info";
          rev = version;
          hash = "sha256-6xmWBrPHghjok43eIDGeshpUEQTuwWLXNHg7CnBUt3Q=";
        };
      });

      niri = prev.niri.override {
        libdisplay-info = final.libdisplay-info_0_2;
      };
    })
  ];

  networking.hostName = "desktop";
  time.timeZone = "America/Sao_Paulo";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "br-abnt2";
  };

  xdg.portal = {
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

  users.users.marcos = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };

  nixpkgs = {
    config.allowUnfree = true;
  };

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  system.stateVersion = "26.05";
}
