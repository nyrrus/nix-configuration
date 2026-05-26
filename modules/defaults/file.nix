{ lib, config, pkgs, ... }:
let 
  cfg = config.defaults.file;
  file = 
    if cfg == "nautilus" && (config.programs.nautilus.enable || lib.any (p: (p.pname or "") == "nautilus") config.environment.systemPackages) then "nautilus.desktop"
    else if cfg == "dolphin" && (config.programs.dolphin.enable || lib.any (p: (p.pname or "") == "dolphin") config.environment.systemPackages) then "dolphin.desktop"
    else "";
in
{
  options.defaults.file = lib.mkOption {
    type = lib.types.enum [ "nautilus" "dolphin" "none" ];
    default = "none";
  };

  config = lib.mkIf (cfg != "none") (lib.mkMerge [
    {
      xdg.mimeApps.defaultApplications = {
        "inode/directory" = [ file ];
        "x-scheme-handler/file" = [ file ];
      };
    }
  ]);
}