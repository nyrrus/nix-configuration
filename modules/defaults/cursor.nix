{ lib, config, pkgs, ... }: 
let 
  cfg = config.defaults.pointerCursor; 
in {
  options.defaults.pointerCursor = lib.mkOption {
    type = lib.types.enum [ "bibata" "vanilla" "none" ];
    default = "none";
  };

  config = lib.mkIf (cfg != "none") {
    home.pointerCursor = lib.mkMerge [
      {
        gtk.enable = true;
        x11.enable = true;
      }
      (lib.mkIf (cfg == "bibata") {
        package = pkgs.bibata-cursors;
        size = 24; 
        name = "Bibata-Modern-Classic"; 
      })
      (lib.mkIf (cfg == "vanilla") {
        package = pkgs.vanilla-dmz;
        size = 28;
        name = "Vanilla-DMZ";
      })
    ];
    home.sessionVariables = {
      XCURSOR_SIZE = toString config.home.pointerCursor.size;
      XCURSOR_THEME = config.home.pointerCursor.name;
    };
  };
}