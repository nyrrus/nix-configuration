{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    home-manager
    
    cmake
    gcc_multi
    gnumake
    pkg-config
    glibc_multi

    vim
    quickshell
  ];
}
