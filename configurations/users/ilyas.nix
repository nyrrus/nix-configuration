{ inputs, config, pkgs, lib, ... }:
{
  imports = [ ../../modules/programs ];
  selection = {
    firefox.enable = true;
  };
  home.packages = with pkgs; [
    neofetch
  ];
  home.username = "ilyas";
  home.homeDirectory = "/home/ilyas";
  programs.home-manager.enable = true;
  home.stateVersion = "24.05";
}
