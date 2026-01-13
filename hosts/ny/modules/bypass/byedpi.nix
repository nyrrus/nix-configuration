{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    byedpi
  ];

  systemd.services.byedpi = {
    description = "ByeDPI to unblock YouTube previews";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.byedpi}/bin/ciadpi --disorder 1";
      Restart = "always";
    };
  };
}