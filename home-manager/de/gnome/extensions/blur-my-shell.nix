{ lib, ... }:{
  dconf.settings = {
  "org/gnome/shell/extensions/blur-my-shell" = {
      brightness = 0.3;           # яркость (интенсивность) эффекта размытия.
      sigma = lib.gvariant.mkInt32 40;                 # сила размытия (чем больше — тем сильнее)
      color = "#000000";        # цвет фона под размытием
      dash-to-dock-blur = true;   # применять размытие к панели дока.
      panel-blur = true;          # размывать верхнюю панель
      overview-blur = true;       # размывать экран обзора (Activities Overview).
      lockscreen-blur = true;     # размывать экран блокировки.
    };
  };
}
