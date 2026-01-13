{ pkgs, ... }: {

  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.gnome.core-utilities.enable = false;
  services.xserver.excludePackages = [ pkgs.xterm ];

  environment.systemPackages = with pkgs; [
    gnome-console
    nautilus
    gnome-tweaks
  ];
  
  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-user-docs
    gnome-characters
    gnome-clocks
    gnome-maps
    gnome-doc-utils
    gnome-autoar
    gnome-connections
    gnome-pass-search-provider
    gnome-text-editor
    atomix
    hitori
    iagno
    tali
    cheese
    totem
    gnome-music
    gnome-photos
    epiphany
    geary
    evince
    gedit
    kgx
    xterm
    contacts
    weather
  ];

}
