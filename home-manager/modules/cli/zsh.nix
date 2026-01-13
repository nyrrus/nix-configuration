{ config, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    # enableAutosuggestions = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases =
      let
        flakeDir = "/etc/nixos/";
        host = "ny";    # FIXME replace with your hostname
        user = "nixos"; # FIXME replace with your username
      in {
      rb = "sudo nixos-rebuild switch --flake ${flakeDir}.#${host} --show-trace";
      upd = "nix flake update";
      upg = "sudo nixos-rebuild switch --upgrade --flake ${flakeDir}.#${host}";

      hms = "home-manager switch --flake ${flakeDir}.#${user}@${host} --show-trace";

      byedpi = "bash ~/zapret-discord-youtube-linux/main_script.sh -nointeractive";

      conf = "c ${flakeDir}";
      # pkgs = "nvim ${flakeDir}/nixos/packages.nix";

      ll = "ls -l";
      c = "code";
      se = "sudoedit";
      ff = "fastfetch";
      nf = "neofetch";
    };

    # history.size = 10000;
    # history.path = "${config.xdg.dataHome}/zsh/history";

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" ];
      theme = "agnoster"; # blinks is also really nice
    };
  };
}