{ lib, ... }:{
  dconf.settings = {
    "org/gnome/shell/extensions/hide-top-bar" = {
        enable-active-window = false;
        enable-intellihide = false;
    };
  };
}
