{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      liberation_ttf

      jetbrains-mono
      nerd-fonts.jetbrains-mono
      noto-fonts-color-emoji
    ];
  };
}
