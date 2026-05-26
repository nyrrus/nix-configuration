{ lib, config, pkgs, ... }:
{
  options.systemSettings.boot.enable =
    lib.mkEnableOption "enable boot";

  config = lib.mkIf config.systemSettings.boot.enable {
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
  };
}
