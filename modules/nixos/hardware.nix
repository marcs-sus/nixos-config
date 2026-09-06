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
  };
}
