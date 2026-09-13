{
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/default.nix
  ];

  time.timeZone = "America/Sao_Paulo";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "br-abnt2";
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
