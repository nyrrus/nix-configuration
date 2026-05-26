{ lib, config, pkgs, ... }:
{
  options.selection.vscode.enable =
    lib.mkEnableOption "enable vscode";

  config = lib.mkIf config.selection.vscode.enable {
    programs.vscode = {
      enable = true;
      profiles.default = {
        extensions = with pkgs.vscode-extensions; [
          pkief.material-icon-theme
          bbenoist.nix
          esbenp.prettier-vscode
        ];
        userSettings = {
          "workbench.statusBar.visible" = false;
          "editor.minimap.enabled" = false;
          "editor.minimap.renderCharacters" = false;
          "workbench.activityBar.location" = "bottom";
          "window.menuBarVisibility" = "compact";
          "workbench.secondarySideBar.defaultVisibility" = "hidden";
          "window.commandCenter" = false;
          "window.titleBarStyle" = "custom";
          "workbench.layoutControl.enabled" = false;
          "chat.commandCenter.enabled" = false;
          "workbench.navigationControl.enabled" = false;
          "editor.defaultFormatter" = "esbenp.prettier-vscode";
          "editor.formatOnSave" = true;
        };
        keybindings = [
          {
          key = "ctrl+alt+z";
          command = "workbench.action.toggleSidebarVisibility";
          }
        ];
      };
    };
  };
}