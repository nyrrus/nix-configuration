{ lib, ... }: {
  settings = {
    "org/gnome/settings-daemon/plugins/media-keys" = {
      # terminal = ["<Super>Return"];
      home = ["<Super>e"];
      show-all-apps = ["<Super>r"];
      screenshot = ["Print"];
      volume-up = ["XF86AudioRaiseVolume"];
      volume-down = ["XF86AudioLowerVolume"];
      volume-mute = ["XF86AudioMute"];
      mic-mute = ["XF86AudioMicMute"];
      next = ["XF86AudioNext"];
      play = ["XF86AudioPlay"];
      pause = ["XF86AudioPause"];
      previous = ["XF86AudioPrev"];
      screen-brightness-up = ["XF86MonBrightnessUp"];
      screen-brightness-down = ["XF86MonBrightnessDown"];
      
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
      ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      name = "Open Control Center";
      binding = "<Super>comma";
      command = "gnome-control-center";
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      name = "Open terminal";
      binding = "<Super>return";
      command = "kgx";
    };
  };
}
