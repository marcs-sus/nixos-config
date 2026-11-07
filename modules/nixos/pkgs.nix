{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.brave.nixosModules.default
  ];

  environment.systemPackages = with pkgs; [
    tuigreet
    pulseaudio
    brightnessctl
    trash-cli
    file-roller
    baobab
    brave-origin
    vim
    neovim
    tree
    wget
    curl
    ripgrep
    git
    fastfetch
    nix-bash-completions
    sbctl
    shellcheck
    nixfmt
    nil
  ];
}
