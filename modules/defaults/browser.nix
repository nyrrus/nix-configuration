{ lib, config, pkgs, ... }:
let 
  cfg = config.defaults.browser;
  browser = 
    if cfg == "firefox" && (config.programs.firefox.enable || lib.any (p: (p.pname or "") == "firefox") config.environment.systemPackages) then "firefox.desktop"
    else if cfg == "librewolf" && (config.programs.librewolf.enable || lib.any (p: (p.pname or "") == "librewolf") config.environment.systemPackages) then "librewolf.desktop"
    else if cfg == "vivaldi" && (lib.any (p: (p.pname or "") == "vivaldi") config.environment.systemPackages) then "vivaldi.desktop"
    else "";
in
{
  options.defaults.browser = lib.mkOption {
    type = lib.types.enum [ "firefox" "librewolf" "vivaldi" "none" ];
    default = "none";
  };

  config = lib.mkIf (cfg != "none") (lib.mkMerge [
    {
      xdg.mimeApps.defaultApplications = {
        "x-scheme-handler/http" = [ browser ];
        "x-scheme-handler/https" = [ browser ];
        "x-scheme-handler/about" = [ browser ];
        "x-scheme-handler/unknow" = [ browser ]; 
      };
    }
  ]);
}