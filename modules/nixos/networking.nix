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

    # Configure network proxy if necessary
    # proxy.default = "http://user:password@proxy:port/";
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  };
}
