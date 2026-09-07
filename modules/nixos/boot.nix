{
  pkgs,
  lib,
  ...
}:
{
  boot = {
    loader = {
      # systemd-boot.enable = true;
      systemd-boot.enable = lib.mkForce false;
      efi.canTouchEfiVariables = true;
    };

    lanzaboote = {
      enable = true;
      pkiBundle = "/var/lib/sbctl";
    };

    kernelPackages = pkgs.linuxPackages_latest;
    initrd.luks.devices."cryptlvm".device = "/dev/disk/by-label/cryptlvm";
  };
}
