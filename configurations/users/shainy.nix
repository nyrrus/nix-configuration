{ inputs, config, pkgs, lib, vars, ... }:
{
  imports = [
    ../../modules/programs 
    ../../modules/defaults 
    ../../modules/desktop/${vars.de}
  ];

  defaults = {
    pointerCursor = "vanilla"; # "bibata" "vanilla"
    browser = "librewolf"; # librewolf | firefox
    text = "vscode"; # vscode | zed
  };
  selection = {
    librewolf.enable = true;
    zsh.enable = true;
    vscode.enable = true;
    git = {
      name = "nyrislam";
      gamil = "nyrikesheihe@gmail.com"; 
    };
  };
  home.packages = with pkgs; [
    fastfetch
    wl-clipboard
    xclip
    libnotify
    nodejs_24
    pnpm
    (python3.withPackages (python-pkgs: with python-pkgs; [
      pillow
      keyboard
      pynput
      pyperclip
      deep-translator
      fastapi
    ]))
  ];
  
  home.username = "shainy";
  home.homeDirectory = "/home/shainy";
  programs.home-manager.enable = true;
  home.stateVersion = "24.05";
}
