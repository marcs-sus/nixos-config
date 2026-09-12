{
  ...
}:
{
  services.syncthing = {
    enable = true;
    settings = {
      devices = {
        "laptop" = {
          name = "laptop";
          id = "PEDDU7Z-67PDWBJ-HGWQ44Z-P5HA3RX-S7372VL-LM4742Y-KRAWKNF-XZ2NAQD";
        };
        "phone" = {
          name = "phone";
          id = "KPDSUUN-GQ3OS6C-F4IRTH6-3NB7PSD-AX37JQY-CQNVOY6-3JJ4QNE-2TEZPQM";
        };
      };
      folders = {
        "KeePass" = {
          id = "keepass";
          path = "/home/marcos/KeePass";
          devices = [
            "laptop"
            "phone"
          ];
          versioning = {
            type = "simple";
            params.keep = "5";
          };
        };
        "Obsidian Vaults" = {
          id = "obsidian-vaults";
          path = "/home/marcos/Documents/Obsidian-Vaults";
          devices = [
            "laptop"
            "phone"
          ];
          versioning = {
            type = "simple";
            params.keep = "5";
          };
        };
        "Prism Launcher Instances" = {
          id = "prism-launcher";
          path = "/home/marcos/.local/share/PrismLauncher/instances";
          devices = [
            "laptop"
          ];
          versioning = {
            type = "simple";
            params.keep = "5";
          };
        };
      };
    };
  };
}
