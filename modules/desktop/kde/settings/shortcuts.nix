{ pkgs, ... }: {
  programs.plasma.shortcuts = {
    "kwin"."Window Close" = [ "Meta+Q" "Alt+F4" ];
    "services/kitty.desktop"."_launch" = "Meta+Return";
  };
  programs.plasma.hotkeys.commands = {
    "launch-browser" = {
      name = "Launch Browser";
      key = "Meta+W";
      command = "xdg-open https://";
    };
  };
}