{ lib, config, pkgs, ... }:
{
  options.systemSettings.fonts.enable =
    lib.mkEnableOption "enable hello";

  config = lib.mkIf config.systemSettings.fonts.enable {
    fonts.packages = with pkgs; [
      nerd-fonts.noto
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      mplus-outline-fonts.githubRelease
      dina-font
      proggyfonts
    ];
  };
}

