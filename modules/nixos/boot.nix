{
  ...
}:
{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    initrd.luks.devices."cryptlvm".device = "/dev/disk/by-label/cryptlvm";
  };
}
