{
  ...
}:
{
  services = {
    kdeconnect = {
      enable = true;
      indicator = true;
    };

    ollama = {
      enable = true;
      acceleration = "vulkan";
    };

    polkit-gnome.enable = true;
  };
}
