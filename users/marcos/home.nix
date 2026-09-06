{
  ...
}:
{
  imports = [
    ../../modules/home-manager/default.nix
  ];

  home = {
    username = "marcos";
    homeDirectory = "/home/marcos";
  };

  programs.home-manager.enable = true;

  home.stateVersion = "26.05";
}
