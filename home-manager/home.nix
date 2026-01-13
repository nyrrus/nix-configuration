{ inputs, outputs, lib, config, pkgs, ... }: {
  
  imports =
    [ # Include the results of the hardware scan.
      ./modules/gui/chatgpt.nix

      ./modules/gui/chromium.nix
      # ./modules/gui/firefox.nix
      ./modules/gui/kitty.nix
      ./modules/gui/obsidian.nix
      ./modules/gui/vscode.nix
      ./modules/gui/spotify.nix
      ./modules/gui/vesktop.nix

      ./modules/cli/timer.nix
      ./modules/cli/git.nix
      ./modules/cli/zsh.nix 

      ./modules/cli/gaming.nix

      ./modules/cli/gtk.nix

      ./de/hyprland/hyprland.nix
      # ./de/gnome/gnome.nix
    ];
    
  home.username = "ny";
  home.homeDirectory = "/home/ny";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    tree
    neofetch
    nftables
    telegram-desktop
    qbittorrent-enhanced
    php
    nodejs_24
    termdown
    pulseaudio
    sound-theme-freedesktop
  ];

  apps.chromium.enable = true;
  programs.home-manager.enable = true;
  systemd.user.startServices = "sd-switch";
}
