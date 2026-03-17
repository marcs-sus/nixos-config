# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    # Include system packages list.
    ./packages/default.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Kernel modules and params.
  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.kernelParams = [
    "loglevel=3"
    "amdgpu.ppfeaturemask=0xfff7ffff"
  ];

  # AMD CPU configurations.
  hardware.cpu.amd = {
    updateMicrocode = true;
  };

  # AMD GPU configurations.
  hardware.amdgpu.initrd.enable = true;
  hardware.amdgpu.opencl.enable = true;
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Define your hostname.
  networking.hostName = "nixos";

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    packages = with pkgs; [
      terminus_font
    ];
    font = "${pkgs.terminus_font}/share/consolefonts/ter-i18n.psf.gz";
    keyMap = "br-abnt2";
    # useXkbConfig = true; # use xkb.options in tty.
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable Bluetooth.
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Experimental = true;
        FastConnectable = true;
      };
      Policy = {
        AutoEnable = true;
      };
    };
  };

  # Enable xone driver for Xbox controllers.
  hardware.xone.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.marcos = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "flatpak"
      "gamemode"
    ];
    packages = with pkgs; [
      tree
    ];
  };

  # Set session variables that are merged into the environment ones.
  environment.sessionVariables = rec {
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";

    # Not officially in the specification
    XDG_BIN_HOME = "$HOME/.local/bin";
    PATH = [
      "${XDG_BIN_HOME}"
    ];

    # Hint Electron apps to use Wayland.
    NIXOS_OZONE_WL = "1";
  };

  # Programs enabled on the system.
  programs = {
    hyprland = {
      enable = true;

      withUWSM = true;
      xwayland.enable = true;
    };

    firefox = {
      enable = true;

      languagePacks = [
        "en-US"
        "pt-BR"
      ];

      preferences = {
        "privacy.resistFingerprinting" = true;
      };

      policies = {
        DisableTelemetry = true;
      };
    };

    regreet = {
      enable = true;

      font = {
        name = "MesloLGM Nerd Font Mono Regular";
        size = 16;
      };

      settings = {
        background = {
          path = "/usr/share/backgrounds/nix-wallpaper-nineish-catppuccin-mocha-alt.png";
          fit = "Cover";
        };

        appearance = {
          greeting_msg = "Welcome to NixOS!";
        };

        GTK = {
          application_prefer_dark_theme = true;
          cursor_blink = true;
        };

        widget = {
          clock = {
            format = "%a %H:%M";
            resolution = "500ms";
            timezone = "America/Sao_Paulo";
            label_width = 200;
          };
        };

        commands = {
          reboot = [
            "systemctl"
            "reboot"
          ];
          poweroff = [
            "systemctl"
            "poweroff"
          ];
        };
      };
    };

    thunar = {
      enable = true;
      plugins = with pkgs; [
        thunar-archive-plugin
        thunar-volman
      ];
    };

    gamemode = {
      enable = true;
      settings = {
        general = {
          renice = 10;
        };
        gpu = {
          apply_gpu_optimisations = "accept-responsibility";
          gpu_device = 1;
          amd_performance_level = "high";
        };
      };
    };

    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };

    xfconf.enable = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Fonts packages installed.
  fonts = {
    packages = with pkgs; [
      nerd-fonts.meslo-lg
      nerd-fonts.fira-code
      nerd-fonts.hack
      noto-fonts
      noto-fonts-color-emoji
      font-awesome
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

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Configure Xdg variables.
  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [ xdg-desktop-portal-hyprland ];
    };

    terminal-exec = {
      enable = true;
      settings = {
        default = [
          "kitty.desktop"
        ];
      };
    };
  };

  # List of services enabled on the system.
  services = {
    greetd = {
      enable = true;
      settings.default_session = {
        command = "start-hyprland -- -c /etc/greetd/hyprland.conf";
        user = "marcos";
      };
    };

    dbus = {
      implementation = "broker";
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };

    flatpak.enable = true;
    openssh.enable = true;
    gnome.gnome-keyring.enable = true;
    blueman.enable = true;
    gvfs.enable = true;
    tumbler.enable = true;
  };

  # enable GNOME Keyring integration for greetd.
  security.pam.services.greetd.enableGnomeKeyring = true;

  # Enable nftables and open ports in the firewall.
  networking.nftables.enable = true;
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      80
      443
      53317 # LocalSend
    ];
    allowedUDPPorts = [
      53317 # LocalSend
    ];
    allowedUDPPortRanges = [
      {
        from = 4000;
        to = 4007;
      }
      {
        from = 8000;
        to = 8010;
      }
    ];
  };

  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Custom systemd service to set framebuffer resolution
  systemd.services.fbset = {
    enable = true;
    description = "Set framebuffer resolution";
    wantedBy = [ "multi-user.target" ];

    before = [
      "getty@tty1.service"
      "greetd.service"
    ];

    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.fbset}/bin/fbset -a -g 1920 1080 1920 1080 32";
    };
  };

  # Enable Flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # Note: system.copySystemConfiguration is not supported with flakes
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.11"; # Did you read the comment?

}
