{ lib, config, pkgs, vars, ... }:
{
  options.systemSettings.users.enable = lib.mkEnableOption "enable users";

  config = lib.mkIf config.systemSettings.users.enable {
    users.users = builtins.listToAttrs (map (name: {
      inherit name;
      value = {    
        isNormalUser  = true;
        extraGroups  = [ "wheel" "networkmanager" ];
        initialPassword = "1";
        shell = pkgs.zsh;
      };
    }) vars.homeProfiles );
    programs.zsh.enable = true;
  };
}