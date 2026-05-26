{ lib, config, pkgs, ... }:
{
  options.systemSettings.video = {
    enable = lib.mkEnableOption "enable video";
    gpu = lib.mkOption {
      type = lib.types.enum [ "amd" "nvidia" "intel" ];
      default = "amd";
    };
  };

  config = lib.mkIf config.systemSettings.video.enable (lib.mkMerge [
    {
      hardware.graphics = {
        enable = true;
        enable32Bit = true;

        extraPackages = 
          if config.systemSettings.video.gpu == "amd" then with pkgs; [ libvdpau-va-gl libva-vdpau-driver ]
          else if config.systemSettings.video.gpu == "intel" then with pkgs; [ intel-media-driver intel-vaapi-driver ]
          else [ ];
      };

      programs.gamemode.enable = true;
      environment.sessionVariables.NIXOS_OZONE_WL = "1";

      services.xserver.videoDrivers = 
        if config.systemSettings.video.gpu == "amd" then [ "amdgpu" ]
        else if config.systemSettings.video.gpu == "nvidia" then [ "nvidia" ]
        else [ "modesetting" ]; # intel
    }

    (lib.mkIf (config.systemSettings.video.gpu == "nvidia") {
      hardware.nvidia = {
        modesetting.enable = true;
        open = true;
        nvidiaSettings = true;
      };
    })

  ]);
}

