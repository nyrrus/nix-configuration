{ lib, pkgs, ... }:{
  dconf.settings = {
    "org/gnome/shell/extensions/dash-to-dock" = {
        dash-max-icon-size = lib.gvariant.mkInt32 32;            # максимальный размер иконок в доке.
        dash-max-smart-hide = true;
        dock-position = "BOTTOM";              # LEFT, RIGHT, BOTTOM
        dock-fixed = false;  # фиксированное положение дока (не двигается).
        intellihide = true; # умное скрытие (скрывать док, если окно рядом).
        extend-height = false; # расширить высоту дока, чтобы покрывать весь экран.всегда
        transparency-mode = "DYNAMIC"; # режим прозрачности: FIXED / DYNAMIC и др.
        background-opacity = 0.3; # непрозрачность фона дока (число от 0.0 до 1.0).
        show-running = true; # показывать индикатор запущенных приложений.
        show-trash = false; # показывать корзину (Trash) в доке.
        show-mounts = false; # показывать подключённые диски.
        custom-theme-shrink = true; # показывать кнопку “Все приложения” вверху.
        use-built-in-theme = true; # темы / стили дока.
        shrink-the-dash = true; # уменьшать размер дока в определённых условиях.
        animate-show-apps = true; # анимация при открытии “Все приложения”.
        running-indicator-style = "DOTS"; # стиль индикатора запущенных программ.
      };
  };
}