{
  ...
}:
{
  users.users = {
    marcos = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "networkmanager"
        "gamemode"
      ];
    };
  };
}
