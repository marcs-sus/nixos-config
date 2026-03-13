{
  config,
  lib,
  pkgs,
  ...
}:

{
  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    # System
    greetd
    regreet
    dbus
    pipewire
    pulseaudio
    seahorse
    bleachbit
    brightnessctl
    pavucontrol
    trash-cli
    fzf
    zip
    unzip
    fbset
    lact

    # Nix
    nixfmt
    nil

    # Terminal
    kitty
    vim
    neovim
    wget
    curl
    git
    lazygit
    htop
    yazi
    openssh
    fastfetch
    bash-completion
    nix-bash-completions

    # Hyprland
    hyprpaper
    hyprpicker
    hypridle
    hyprlock
    hyprcursor
    hyprshot
    hyprpolkitagent
    hyprshutdown
    hyprlang
    waybar
    rofi
    cliphist
    networkmanagerapplet
    mako
    nwg-look

    # Communication
    zapzap
    vesktop
    thunderbird

    # Graphical Tools
    firefox
    crow-translate
    qalculate-gtk
    gimp
    audacity
    obsidian
    baobab
    gromit-mpx
    vscodium

    # File Management
    file-roller
    syncthing
    qbittorrent
    localsend

    # Media
    vlc
    mpv
    kdePackages.gwenview
    obs-studio
    ffmpeg

    # Security
    keepassxc
    ente-auth

    # Gaming
    steam
    mangohud
    gamemode
    protonup-qt
    goverlay

    # Wayland
    wayland-utils
    wl-clipboard
    wl-clip-persist

    # GTK & Qt
    gtk4
    kdePackages.qt6ct

    # Libs
    libnotify
    libsecret
    gcr
  ];
}
