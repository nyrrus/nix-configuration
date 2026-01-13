{ pkgs, ... }:{
  programs.zsh.initContent = ''
    timer() {
      if [ "$#" -ne 1 ]; then
        echo "Использование: timer <время>, например: timer 2h"
        return 1
      fi
      ${pkgs.termdown}/bin/termdown "$1" && \
      ${pkgs.libcanberra-gtk3}/bin/canberra-gtk-play -i phone-incoming-call
    }
  '';
}
