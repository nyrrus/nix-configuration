{ config, lib, pkgs, ... }:

with lib;
{
  options = {
    selection = {
      git = {
        name = mkOption {
          type = types.str;
          default = "";
          description = "Git User Name";
        };
        gamil = mkOption {
          type = types.str;
          default = "";
          description = "Git Email";
        };
      };
    };
  };

  config = {
    programs.git = {
      enable = true;
      userName = config.selection.git.name;
      userEmail = config.selection.git.gamil;
    };
  };
}