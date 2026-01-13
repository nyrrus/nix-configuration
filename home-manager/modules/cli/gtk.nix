{ config, pkgs, ... }:
{
  gtk = {
    
    enable = true;
    theme = {
      name = "Everforest-Dark-BL-LB";
      package = pkgs.everforest-gtk-theme; 
      #package = pkgs.everforest-gtk-theme/Everforest-Dark-BL 
      #package = pkgs.gruvbox-gtk-theme  
      #package = pkgs.whitesur-gtk-theme
    };
    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme; 
      #package = pkgs.papirus-icon-theme
    };
    cursorTheme = {
      name = "Numix-Cursor";
      package = pkgs.numix-cursor-theme; 
      #package = pkgs.apple-cursor/macOS-White 
      #package = pkgs.vanilla-dmz
    };
  };
}