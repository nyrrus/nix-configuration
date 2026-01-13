{ ... }: {
  networking = {
    networkmanager = {
      enable = true;
    };
    
    nameservers = [ "8.8.8.8" "1.1.1.1" ];
    
    firewall = {
      enable = true;
      allowedTCPPorts = [ 80 443 ];
      allowedUDPPorts = [ 443 ];
      allowedUDPPortRanges = [
        { from = 50000; to = 65535; }
      ];
    };
  };
  
  hardware.bluetooth.enable = true;
}
