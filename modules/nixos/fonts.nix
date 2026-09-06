{
  pkgs,
  ...
}:
{
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      fira-code
      fira-code-symbols
      nerd-fonts.meslo-lg
      nerd-fonts.hack
    ];

    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "MesloLGM Nerd Font Mono" ];
        serif = [ "Noto Serif" ];
        sansSerif = [ "Noto Sans" ];
      };
    };
  };
}
