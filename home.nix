{ config, pkgs, ... }:

{
  imports = [
    # Include Catppuccin theming
    ./themes/catppuccin.nix
  ];

  home = {
    username = "marcos";
    homeDirectory = "/home/marcos";
    stateVersion = "25.11";

    sessionVariables = {
      TERMINAL = "kitty";
      GTK_THEME = "catppuccin-mocha-mauve-standard";
    };
  };

  programs = {
    bash = {
      enable = true;

      shellAliases = {
        nixos-upgrade = "sudo nixos-rebuild switch --upgrade";
        nixos-flake-upgrade = "sudo nixos-rebuild switch --upgrade --flake";
      };

      # Basic Oh My Bash initialization
      initExtra = ''
        if [ -d "$HOME/.oh-my-bash" ]; then
          case $- in
            *i*) ;;
              *) return;;
          esac

          export OSH="$HOME/.oh-my-bash"
          OSH_THEME="font"
          source "$OSH/oh-my-bash.sh"
        fi
      '';
    };

    kitty = {
      shellIntegration.enableBashIntegration = true;
    };
  };

  programs.home-manager.enable = true;
}
