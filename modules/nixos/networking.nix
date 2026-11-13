{
  ...
}:
{
  networking = {
    hostName = "desktop";

    networkmanager.enable = true;
    nftables.enable = true;

    firewall = {
      enable = true;

      allowedTCPPorts = [
        80
        443
        22
      ];

      allowedUDPPorts = [
        9
      ];

      allowedTCPPortRanges = [
        {
          from = 1714;
          to = 1764;
        }
      ];
      allowedUDPPortRanges = [
        {
          from = 1714;
          to = 1764;
        }
      ];
    };

    interfaces.enp7s0 = {
      wakeOnLan.enable = true;
    };

    # Configure network proxy if necessary
    # proxy.default = "http://user:password@proxy:port/";
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  };
}
