{ config, pkgs, lib, ... }: 
{
  services.desktopManager.gnome.enable = true;
  services.displayManager.gdm.enable = true;

  services.xserver.xkb.layout = "us,ru";
  services.xserver.xkb.variant = ",phonetic";
  services.xserver.xkb.options = "grp:win_space_toggle";

  services.xserver.enable = true;
}