{ pkgs, ... }: {
    programs.hyprland.enable = true;
    services.xserver.displayManager.gdm.enable = true;
    
    xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
    };

    environment.systemPackages = with pkgs; [
        kitty
        waybar
        wofi
        swww
        swaynotificationcenter
        nwg-look
        nautilus
        
        imagemagick
        bc
        wget
        curl
        matugen

        glib
        gsettings-desktop-schemas
    ];
}