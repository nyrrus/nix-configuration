{ lib, config, pkgs, ... }:
let
  cfg = config.defaults.text;
  text = 
    if cfg == "vscode" && (config.programs.vscode.enable || lib.any (p: (p.pname or "") == "vscode") config.environment.systemPackages) then "code.desktop"
    else if cfg == "zed" && (config.programs.zed.enable || lib.any (p: (p.pname or "") == "zed") config.environment.systemPackages) then "zeditor.desktop"
    else "";
in
{
  options.defaults.text = lib.mkOption {
    type = lib.types.enum [ "vscode" "zed" "none" ];
    default = "none";
  };

  config = lib.mkIf (cfg != "none") (lib.mkMerge [
    {
      xdg.mimeApps.defaultApplications = {
        "text/plain" = [ text ];
        "application/json" = [ text ];
        "text/markdown" = [ text ];
      };
    }
  ]);
}