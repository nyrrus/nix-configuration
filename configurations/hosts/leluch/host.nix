{ system, pkgs, inputs, vars,... }: 
{
  home-manager = {
    extraSpecialArgs = { inherit inputs system pkgs vars; };
    backupFileExtension = "backup";
    users = builtins.listToAttrs (map (name: {
      inherit name;
      value = import ../../home/${name}.nix;
    }) vars.homeProfiles);
  };
}