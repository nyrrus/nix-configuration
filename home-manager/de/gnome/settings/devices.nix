{ lib, ... }: {
  settings = {
    "org/gnome/desktop/input-sources" = {
      sources = [
        (lib.gvariant.mkTuple ["xkb" "us"])
        (lib.gvariant.mkTuple ["xkb" "ru"])
        (lib.gvariant.mkTuple ["xkb" "ua"])
      ];
      xkb-options = [ "grp:win_space_toggle" ];
    };
  };
}
