{ lib, config, pkgs, ... }:
{
  options.selection.librewolf.enable =
    lib.mkEnableOption "enable librewolf";
    
  config = lib.mkIf config.selection.librewolf.enable {
    programs.librewolf = {
      enable = true;
      package = pkgs.librewolf.override {
        cfg = {
          ffmpegSupport = true;
          enableWidevine = true;
        };
      };
      policies.SearchEngines.Default = "Google";
      settings = {
        "privacy.sanitize.sanitizeOnShutdown" = false;
        "privacy.clearOnShutdown.cookies" = false;
        "privacy.clearOnShutdown.sessions" = false;
        "signon.rememberSignons" = true;
        "privacy.resistFingerprinting" = false; 
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