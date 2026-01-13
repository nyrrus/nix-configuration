{ config, pkgs, lib, ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = false;
    
    settings = [{
      layer = "bottom";
      position = "bottom";
      exclusive = true;
      height = 36;
      margin-left = 0;
      margin-right = 0;
      margin-top = 0;
      fixed-center = true;
      reload_style_on_change = true;

      modules-left = [ "hyprland/workspaces#active" "hyprland/workspaces#unactive" ];
      modules-center = [ "hyprland/window" ];
      modules-right = [ "group/demo" "group/sound" "group/wifi" "group/date" ];

      # --- Описания групп ---
      "group/launcher" = {
        orientation = "inherit";
        drawer = { transition-duration = 200; transition-left-to-right = true; };
        modules = [ "custom/menu" "custom/lock" "custom/reboot" "custom/poweroff" ];
      };
      "group/date" = {
        orientation = "inherit";
        drawer = { transition-duration = 200; transition-left-to-right = true; };
        modules = [ "clock" "clock#4" ];
      };
      "group/wifi" = {
        orientation = "inherit";
        drawer = { transition-duration = 200; transition-left-to-right = true; };
        modules = [ "network" "network#speed" ];
      };
      "group/sound" = {
        orientation = "inherit";
        drawer = { transition-duration = 200; transition-left-to-right = true; };
        modules = [ "pulseaudio" "pulseaudio/slider" ];
      };
      "group/demo" = {
        orientation = "inherit";
        drawer = { transition-duration = 200; transition-right-to-left = true; };
        modules = [ "custom/tray" "custom/swaync" "tray" ];
      };

      # --- Конфигурация модулей ---
      "custom/menu" = { format = "app"; on-click = "pkill wofi || wofi --show drun"; tooltip = false; };
      "custom/poweroff" = { format = "⏻  off"; on-click = "systemctl poweroff"; tooltip = false; };
      "custom/reboot" = { format = "  reboot"; on-click = "systemctl reboot"; tooltip = false; };
      "custom/lock" = { format = "  loc"; on-click = "loginctl lock-session"; tooltip = false; };
      
      "clock" = { format = "{:%R}"; tooltip-format = "<big>{:%R}</big>"; };
      "clock#4" = {
        format = "{:%Y-%m-%d}";
        calendar = {
          mode = "year";
          weeks-pos = "right";
          format = { today = "<span color='#ff6699'><b><u>{}</u></b></span>"; };
        };
      };

      "pulseaudio" = {
        format = "{icon}";
        format-icons = { default = ["" "" ""]; };
        on-click = "pavucontrol";
      };
      "pulseaudio/slider" = { min = 0; max = 100; orientation = "horizontal"; };

      "network" = { format-wifi = ""; format-ethernet = ""; format-disconnected = "⚠"; };
      "network#speed" = { format = " {bandwidthDownBits} "; interval = 5; };

      "hyprland/workspaces#active" = {
        active-only = true;
        format = "{name}";
      };
      "hyprland/workspaces#unactive" = {
        format = "{name}";
        on-click = "activate";
        all-outputs = true;
        persistent-workspaces = { "1" = []; "2" = []; "3" = []; "4" = []; };
      };
      "hyprland/window" = { max-length = 25; format = "{}"; };
      "tray" = { icon-size = 16; spacing = 4; };
      "custom/swaync" = {
        format = "{icon}";
        exec = "swaync-client -swb";
        on-click = "swaync-client -t -sw";
        return-type = "json";
      };
    }];

    style = ''
* {
  font-family: "Monocraft", "JetBrainsMono Nerd Font Propo";
  font-weight: bold;
  font-size: 14px;
  border: none;
  border-radius: 0;
  box-shadow: none;
  text-shadow: none;
  margin: 0;
  padding: 0;
}

window#waybar {
  background: #111111; /* Carbon Black */
}

tooltip {
  padding: 9px;
  background: #111111; /* Carbon Black */
  color: #FFFFFF;
}

/* Слайдер пульса */
#pulseaudio-slider slider {
  min-height: 3px;
  min-width: 3px;
  background: #FFFFFF;
}
#pulseaudio-slider trough {
  min-height: 4px;
  min-width: 56px;
  background-color: rgba(11, 11, 11, 0.1);
}
#pulseaudio-slider highlight {
  min-height: 4px;
  background-color: #22d166; /* F1 Red */
}

#launcher,
#demo,
#sound,
#wifi,
#date,
#workspace {
  margin: 3px 3px;
  background: rgba(11, 11, 11, 0.01);
  color: #FFFFFF;
  border-radius: 0px;
}

#custom-menu,
#custom-poweroff,
#custom-reboot,
#custom-lock,
#clock,
#network,
#pulseaudio,
#pulseaudio-slider,
#custom-tray,
#tray,
#workspaces button,
#custom-swaync {
  padding: 0px 9px;
  margin: 3px 3px;
  background: rgba(11, 11, 11, 0.01);
  border-radius: 0px;
}

#custom-menu:hover,
#custom-poweroff:hover,
#custom-reboot:hover,
#custom-lock:hover,
#clock:hover,
#network:hover,
#pulseaudio:hover,
#pulseaudio-slider:hover,
#custom-tray:hover,
#tray:hover,
#custom-swaync:hover {
  background: rgba(11, 11, 11, 0.01);
}

/* Workspaces */
#workspaces button {
  color: #FFFFFF;
}

/* ПРАВИЛЬНОЕ СКРЫТИЕ ДЛЯ GTK (Waybar) */

/* Скрываем активную кнопку во втором модуле */
#workspaces.unactive button.active {
    background: none;
    border: none;
    box-shadow: none;
    text-shadow: none;
    color: transparent;
    padding: 0;
    margin: 0;
    min-width: 0;
    min-height: 0;
    font-size: 0;
}

/* Скрываем неактивные кнопки в первом модуле (на всякий случай) */
#workspaces.active button:not(.active) {
    background: none;
    border: none;
    box-shadow: none;
    text-shadow: none;
    color: transparent;
    padding: 0;
    margin: 0;
    min-width: 0;
    min-height: 0;
    font-size: 0;
}

/* Стили для видимого активного воркспейса (индекс 0) */
#workspaces.active button.active {
    color: #FFFFFF;
    background: #22d166;
    padding: 0px 18px;
    margin-right: 10px; /* Отступ от остальных */
}

/* Стили для неактивных воркспейсов */
#workspaces.unactive button {
    color: #FFFFFF;
    background: rgba(11, 11, 11, 0.01);
    padding: 0px 9px;
    margin: 0 2px;
}

/* Заголовок окна */
#hyprland-window {
  color: #FFFFFF;
  margin: 0 10px;
}
'';
  };
}
