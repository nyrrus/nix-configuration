{ lib, pkgs, ... }:{ 
# 💙 List Gnome Extensions / Disable with "#"
  imports = [
    ./dash-to-dock.nix
    ./blur-my-shell.nix
    ./hide-top-bar.nix
    # ./pop-shell.nix
    ./top-bar-organizer.nix
    ./user-themes.nix
  ];

  dconf.enable = true;
  
# 💙 Install extensions 
  home.packages = with pkgs.gnomeExtensions; [
    user-themes
    dash-to-dock
    blur-my-shell
    top-bar-organizer
    logo-menu
    hide-top-bar
    pop-shell
    timer
  ];

# 💙 Enable extensions 
  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "dash-to-dock@micxgx.gmail.com"
        "blur-my-shell@aunetx"
        "top-bar-organizer@julian.gse.jsts.xyz"
        "logomenu@aryan_k"
        "hidetopbar@mathieu.bidon.ca"
        # "pop-shell@system76.com"
        "timer@k-m-r.github.com"
      ];
    };
  };
}
