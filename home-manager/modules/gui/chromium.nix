{ pkgs, config, lib, ... }:

let
  cfg = config.apps.chromium;
in
{
  options.apps.chromium = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable Chromium with selected extensions and privacy flags.";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.chromium = {
      enable = true;
      package = pkgs.chromium; # можно заменить на ungoogled-chromium
      commandLineArgs = [
        "--proxy-server=socks5://127.0.0.1:1080"
        "--disable-quic"
      ];
      extensions = [
        "giokfhncgfjkoamdbhfhfhgpikaioccc" # gruvbox slate
        "ddkjiahejlhfcafbddmgiahcphecmpfh" # uBlock
        "gcknhkkoolaabfmlnjonogaaifnjlfnp" # FoxyProxy
        "eimadpbcbfnmbkopoojfekhnkhdbieeh" # Dark Reader
        "fihnjjcciajhdojfnbdddfaoknhalnja" # I don't care about cookies
        "mnjggcdmjocbbbhaepdhchncahnbgone" # SponsorBlock
        "dhdgffkkebhmkfjojejmpbldmpobfkfo" # Tampermonkey
        "adlpodnneegcnbophopdmhedicjbcgco" # Free VPN for Chrome - Troywell VPN
      ];
    };
  };
}
