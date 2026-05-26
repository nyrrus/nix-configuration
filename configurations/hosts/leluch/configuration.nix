{ inputs, config, pkgs, system, lib, vars, ... }:
let
  de = vars.de;
in
{
  imports = [
    ./host.nix
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
    ../../../modules/system
    ../../../modules/desktop
  ];
  
  systemSettings = {
    audio.enable = true;
    boot.enable = true;
    fonts.enable = true;
    locale.enable = true;
    networking.enable = true;
    nix.enable = true;
    packages.enable = true;
    users.enable = true;
    video = {
      enable = true;
      gpu = "nvidia"; # "amd" "nvidia" "intel"
    };
  };

  system.stateVersion = "24.05";
}