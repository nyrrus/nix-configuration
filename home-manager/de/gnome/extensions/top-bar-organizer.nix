{ lib, ... }:{
  dconf.settings = {
    "org/gnome/shell/extensions/top-bar-organizer" = {
      left-box-order = [ "activities" ];
      center-box-order = [ "dateMenu" ];
      right-box-order = [ "keyboard" "panelTimer" "quickSettings" ];
      show-activities-button = false;
    };
  };
}