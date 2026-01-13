{ lib, pkgs, ... }:
let
  autostart = import ./autostart.nix { inherit lib; };
  devices = import ./devices.nix { inherit lib; };
  keymaps = import ./keymaps.nix { inherit lib; };
  windowrules = import ./windowrules.nix { inherit lib; };
in 
{
  dconf.settings = lib.mkMerge [
        autostart.settings
        devices.settings
        keymaps.settings
        windowrules.settings
      ];
}

