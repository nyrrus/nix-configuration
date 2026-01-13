{ pkgs, config, ...}: {
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = {
      source = 
        let configPath = "/etc/nixos/home-manager/de/hyprland/hypr/conf"; in
        [
          "${configPath}/autostart.conf"
          "${configPath}/devices.conf"
          "${configPath}/settings.conf"
          "${configPath}/keymaps.conf"
          "${configPath}/windowrules.conf"
        ];
    };
  };
}