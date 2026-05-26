{ lib, config, pkgs, vars, ... }:
{
  options.systemSettings.networking.enable =
    lib.mkEnableOption "enable networking";

  config = lib.mkIf config.systemSettings.networking.enable {
    networking = {
      hostName = "${vars.host}";
      networkmanager.enable = true;
      enableIPv6 = false;
      
      networkmanager.dns = "default";
      nameservers = [ "1.1.1.1" "1.0.0.1" ];

      firewall = {
        enable = true;
        checkReversePath = false;
        trustedInterfaces = [ "tun0" "amnezia0" ];

        allowedTCPPorts = [ 
          80 443       # HTTP/HTTPS
          1080         # SOCKS5
          53           # DNS
          25510 27015 27036 # Steam / Games
        ];

        allowedUDPPorts = [ 
          53 1194 51820 # DNS, OpenVPN, WireGuard
          3478 4379 4380 27015 27031 27036 3074 # Steam / P2P / Voice
        ];

        allowedUDPPortRanges = [
          { from = 4000; to = 4010; }   # Разное
          { from = 8000; to = 8020; }   # Разное
          { from = 27000; to = 27100; } # Steam Client
          { from = 50000; to = 60000; } # Динамические порты
        ];
      };
    };
    
    services.openssh.enable = true;
  };
}

