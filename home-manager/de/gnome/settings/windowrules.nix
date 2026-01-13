{ lib, ... }:

{
  settings = {
  "org/gnome/settings-daemon/plugins/power" = {
    sleep-inactive-ac-type = "suspend";
    sleep-inactive-ac-timeout = lib.gvariant.mkUint32 14400;
    sleep-inactive-battery-type = "suspend";
    sleep-inactive-battery-timeout = lib.gvariant.mkUint32 14400;
  };

  "org/gnome/desktop/wm/preferences" = {
    focus-mode = "sloppy";
    auto-raise = true;
    raise-on-click = false;
    button-layout = "appmenu:maximize,close";
  };

  "org/gnome/mutter" = {
    experimental-features = ["scale-monitor-framebuffer"];
    workspaces-only-on-primary = false;
  };

  "org/gnome/desktop/interface" = {
    scaling-factor = lib.gvariant.mkInt32 1;
    text-scaling-factor = lib.gvariant.mkDouble 0.9;
    
    color-scheme = "prefer-dark";
    
    show-battery-percentage = true;
  };
  
  };
}
