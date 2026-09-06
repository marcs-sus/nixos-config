{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.niri.nixosModules.niri
  ];

  nixpkgs.overlays = [ inputs.niri.overlays.niri ];

  programs = {
    niri = {
      enable = true;
      package = pkgs.niri-unstable;
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

    gamemode.enable = true;
  };
}
