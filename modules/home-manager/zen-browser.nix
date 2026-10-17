{
  inputs,
  ...
}:
let
  extension = shortId: guid: {
    name = guid;
    value = {
      install_url = "https://addons.mozilla.org/firefox/downloads/latest/${shortId}/latest.xpi";
      installation_mode = "normal_installed";
    };
  };

  extensions = [
    (extension "ublock-origin" "uBlock0@raymondhill.net")
    (extension "keepassxc-browser" "keepassxc-browser@keepassxc.org")
    (extension "dark" "{793d9e3d-5bf2-4e98-8b4a-dada04364160}")
  ];
in
{
  imports = [
    inputs.zen-browser.homeModules.beta
  ];

  programs.zen-browser = {
    enable = true;

    policies = {
      DisableTelemetry = true;

      ExtensionSettings = builtins.listToAttrs extensions;

      Preferences = {
        "extensions.autoDisableScopes" = {
          Value = 0;
          Status = "locked";
        };

        "extensions.pocket.enabled" = {
          Value = false;
          Status = "locked";
        };
      };
    };

    profiles.default = {
      search = {
        force = true;
        default = "ddg";

        engines = {
          nixpkgs = {
            name = "nixpkgs packages";
            urls = [
              {
                template = "https://search.nixos.org/packages?query={searchTerms}";
              }
            ];
            icon = "https://wiki.nixos.org/favicon.ico";
            definedAliases = [ "@np" ];
          };

          nixos-options = {
            name = "NixOS options";
            urls = [
              {
                template = "https://search.nixos.org/options?query={searchTerms}";
              }
            ];
            icon = "https://wiki.nixos.org/favicon.ico";
            definedAliases = [ "@no" ];
          };

          nixos-wiki = {
            name = "NixOS Wiki";
            urls = [
              {
                template = "https://wiki.nixos.org/w/index.php?search={searchTerms}";
              }
            ];
            icon = "https://wiki.nixos.org/favicon.ico";
            definedAliases = [ "@nw" ];
          };

          noogle = {
            name = "noogle";
            urls = [
              {
                template = "https://noogle.dev/q?term={searchTerms}";
              }
            ];
            icon = "https://noogle.dev/favicon.ico";
            definedAliases = [ "@ng" ];
          };
        };
      };
    };
  };
}
