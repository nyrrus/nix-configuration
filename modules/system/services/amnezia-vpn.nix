{ lib, config, pkgs, ... }:
{
  options.systemSettings.VPN.amnezia-vpn.enable =
    lib.mkEnableOption "enable amnezia-vpn";

  config = lib.mkIf config.systemSettings.VPN.amnezia-vpn.enable {
    environment.systemPackages = with pkgs; [
      amnezia-vpn
    ];
    systemd.services.amnezia-vpn = {
      description = "Amnezia VPN Background Service";
      after = [ "network.target" ];
      wantedBy = [ "multi-user.target" ];
      
      serviceConfig = {
        ExecStart = "${pkgs.amnezia-vpn}/bin/AmneziaVPN-service"; 
        Restart = "always";
        RestartSec = 5;
      };
    };
  };
}
