{ lib, config, pkgs, ... }:
{
  options.systemSettings.locale.enable =
    lib.mkEnableOption "enable locale";

  config = lib.mkIf config.systemSettings.locale.enable {
    time.timeZone = "Europe/Moscow";
    i18n.defaultLocale = "en_US.UTF-8";
    services.xserver.xkb.layout = "us,ru";
    services.xserver.xkb.options = "grp:win_space_toggle";
  };
}

