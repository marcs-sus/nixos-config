{
  pkgs,
  inputs,
  lib,
  ...
}:
{
  imports = [
    inputs.niri.nixosModules.niri
  ];

  nixpkgs.overlays = [
    inputs.niri.overlays.niri

    #(final: prev: {
    #  libdisplay-info_0_2 = prev.libdisplay-info.overrideAttrs (old: rec {
    #    version = "0.2.0";
    #    src = final.fetchFromGitLab {
    #      domain = "gitlab.freedesktop.org";
    #      owner = "emersion";
    #      repo = "libdisplay-info";
    #      rev = version;
    #      hash = "sha256-6xmWBrPHghjok43eIDGeshpUEQTuwWLXNHg7CnBUt3Q=";
    #    };
    #  });
    #  niri = prev.niri.override {
    #    libdisplay-info = final.libdisplay-info_0_2;
    #  };
    #})
  ];

  programs = {
    niri = {
      enable = true;
      package = lib.mkForce pkgs.niri-unstable;
    };

    thunar = {
      enable = true;
      plugins = with pkgs; [
        thunar-archive-plugin
        thunar-vcs-plugin
        thunar-media-tags-plugin
        thunar-volman
      ];
    };

    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];

    };

    gamemode = {
      enable = true;
      settings = {
        general = {
          renice = 10;
        };

        gpu = {
          apply_gpu_optimisations = "accept-responsibility";
          gpu_device = 0;
          amd_performance_level = "high";
        };
      };
    };

    dconf.enable = true;
  };
}
