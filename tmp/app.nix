{ lib, config, pkgs, ... }:
{
  options.selection.app.enable =
    lib.mkEnableOption "enable app";

  config = lib.mkIf config.selection.app.enable {

  };
}