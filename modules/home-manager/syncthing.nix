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
          id = "45WI3QJ-OLCSI3W-VJDRZSA-M7I4AY2-552B5X4-TJEJT2C-INOOBDG-KRX6WAI";
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

        "RetroArch Game Saves" = {
          id = "retroarch-saves";
          path = "/home/marcos/.config/retroarch/saves";
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
