{ lib, config, pkgs, vars, ... }:
{
  options.selection.zsh.enable =
    lib.mkEnableOption "enable zsh";

  config = lib.mkIf config.selection.zsh.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases =
      let
        flakeDir = "/etc/nixos";
        host = "${vars.host}";    # FIXME replace with your hostname
        user = "${vars.user}"; # FIXME replace with your username
      in {
        rb = "sudo nixos-rebuild switch --flake ${flakeDir}#${host}";
        hs = "sudo home-manager switch";
        cf = "sudo code --no-sandbox --user-data-dir /root/.vscode-root ${flakeDir}";
        ll = "ls -l";
      };

      oh-my-zsh = {
        enable = true;
        plugins = [ "git" "sudo" ];
        theme = "agnoster";
      };
    };
  };
}