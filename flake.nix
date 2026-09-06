{
  description = "My NixOS configuration";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Niri
    niri = {
      url = "github:sodiboo/niri-flake";
    };

    # Noctalia
    noctalia = {
      url = "github:noctalia-dev/noctalia/cachix";
    };

    # Zen Browser
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      ...
    }:
    {
      # NixOS configuration entrypoint
      # Available through 'nixos-rebuild --flake .#hostname'
      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";

          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/desktop/configuration.nix

            home-manager.nixosModules.default
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = { inherit inputs; };
                users.marcos = ./users/marcos/home.nix;
              };
            }
          ];
        };
      };
    };

  nixConfig = {
    extra-substituters = [ "https://noctalia.cachix.org" ];
    extra-trusted-public-keys = [
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
    ];
  };
}
