# nixos-config

My NixOS configuration with Flake and Home Manager

# Flake structure

```bash
nixos-config
├── flake.lock
├── flake.nix
├── hosts
│   └── desktop
│       ├── configuration.nix
│       └── hardware-configuration.nix
├── modules
│   ├── default.nix
│   ├── home-manager
│   │   ├── git.nix
│   │   ├── niri.nix
│   │   ├── noctalia.nix
│   │   ├── pkgs.nix
│   │   ├── programs.nix
│   │   ├── services.nix
│   │   ├── shell.nix
│   │   ├── stylix.nix
│   │   ├── syncthing.nix
│   │   └── zen-browser.nix
│   └── nixos
│       ├── boot.nix
│       ├── environment.nix
│       ├── fonts.nix
│       ├── hardware.nix
│       ├── networking.nix
│       ├── nix.nix
│       ├── pkgs.nix
│       ├── programs.nix
│       ├── security.nix
│       ├── services.nix
│       ├── users.nix
│       └── xdg.nix
├── README.md
└── users
    └── marcos
        └── home.nix
```
