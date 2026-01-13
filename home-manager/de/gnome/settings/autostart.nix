{ lib, ... }: {
  settings = {
    "org/gnome/gnome-session" = {
      auto-save-session = true;
    };
  };
}
