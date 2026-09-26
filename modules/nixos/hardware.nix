{
  ...
}:
{
  hardware = {
    cpu.amd.updateMicrocode = true;
    amdgpu.initrd.enable = true;

    graphics = {
      enable = true;
      enable32Bit = true;
    };

    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Experimental = true;
          FastConnectable = true;
        };
        Policy = {
          AutoEnable = true;
        };
      };
    };
  };

  fileSystems."/mnt/storage" = {
    device = "/dev/disk/by-label/storage";
    fsType = "ext4";
  };
}
