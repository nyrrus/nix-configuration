{ lib, config, pkgs, ... }:
{
  options.systemSettings.audio.enable =
    lib.mkEnableOption "enable audio";

  config = lib.mkIf config.systemSettings.audio.enable {
    services.pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      jack.enable = true;
    };
    security.rtkit.enable = true;
    hardware.bluetooth.enable = true;
  };
}

