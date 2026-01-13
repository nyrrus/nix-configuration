{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix

    # System
    ./system/boot.nix
    ./system/networking.nix
    ./system/locale.nix
    ./system/audio.nix
    ./system/users.nix
    ./system/nix.nix
    ./system/packages.nix
    ./system/fonts.nix
    ./system/video.nix

    # DE 
    # ./modules/de/gnome.nix
    ./modules/de/hyprland.nix

    # Networking
    ./modules/bypass/byedpi.nix
  ];
  
  nixpkgs.config.allowUnfree = true;
  programs.dconf.enable = true;
  time.timeZone = "Europe/Moscow";
  system.stateVersion = "25.05";
}
