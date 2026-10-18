{
  ...
}:
{
  nix = {
    settings = {
      trusted-users = [
        "root"
        "marcos"
      ];

      experimental-features = [
        "nix-command"
        "flakes"
      ];

      auto-optimise-store = true;
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
  };
}
