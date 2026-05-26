{ lib, config, pkgs, ... }:
{
  options.selection.firefox.enable =
    lib.mkEnableOption "enable firefox";

  config = lib.mkIf config.selection.firefox.enable {
    programs.firefox = {
      enable = true;
      package = pkgs.firefox.override {
        cfg = {
          ffmpegSupport = true;
          enableWidevine = true;
        };
      };
      profiles = {
        "user" = {
          id = 0;
          isDefault = true;
          extensions = with pkgs.nur.repos.rycee.firefox-addons; [
            ublock-origin
            sponsorblock
            darkreader
            tampermonkey
            foxyproxy-standard
            i-dont-care-about-cookies
            simple-dark-vlasak
            vimium
            plasma-integration
          ];
        };
      };
    };
  };
}