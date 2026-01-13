{ config, pkgs, lib, ... }:

{
  programs.wofi = {
    enable = true;

    # Определяем тему как строку (Heredoc)
    style = ''
/* F1 Theme for Wofi */
* {
    /* Используем тот же шрифт, что и в Waybar */
    font-family: "Monocraft, JetBrainsMono Nerd Font Propo";
    font-size: 14px;
    
    /* Основные цвета F1 */
    background-color: #111111; /* Carbon Black (Фон) */
    color: #FFFFFF;            /* Белый текст */
    border: none;
    border-radius: 0px;
    margin: 0px;
    padding: 0px;
}

window {
    /* Устанавливаем ширину и небольшую прозрачность */
    width: 300px;
    opacity: 0.95;
}

input {
/* Строка ввода */
    padding: 10px;
    margin: 5px;
    border-bottom: 2px solid #FF1801; /* F1 Red как разделитель */
    background-color: #111111;
}

#outer-box {
    padding: 10px;
}

#scroll {
    /* Контейнер списка */
    margin-top: 5px;
}

entry {
    /* Элементы списка приложений */
    padding: 8px 10px;
    margin: 3px 5px;
    border-radius: 2px;
}

entry:hover {
    background-color: rgba(255, 24, 1, 0.3); /* Приглушенный красный при наведении */
}

entry:selected {
    /* Выбранный элемент */
    background-color: #FF1801; /* F1 Red (Акцент) */
    color: #111111;            /* Черный текст на красном фоне */
    font-weight: bold;
}
    '';
  };
}
