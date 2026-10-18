{
  ...
}:
{
  imports = [
    ../../modules/default.nix
  ];

  home = {
    username = "marcos";
    homeDirectory = "/home/marcos";
  };

  programs.home-manager.enable = true;

  nixpkgs = {
    config.allowUnfree = true;
  };

  home.stateVersion = "26.05";
}
