{ config, ... }: {
  programs.plasma.panels = [
    {
      location = "bottom";
      height = 44;
      floating = true;
      hiding = "dodgewindows";
      widgets = [
        { name = "org.kde.plasma.kickoff"; config.General.icon = "nix-snowflake-white"; }
        "org.kde.plasma.icontasks"
        "org.kde.plasma.panelspacer"
        {
          name = "org.kde.plasma.systemtray";
          config.General.knownItems = [
              "org.kde.plasma.clipboard"
              "org.kde.plasma.battery"
              "org.kde.plasma.networkmanagement"
              "org.kde.plasma.bluetooth"
              "org.kde.plasma.volume"
              "org.kde.plasma.notifications"
          ];
        }
        "org.kde.plasma.digitalclock"
      ];
    }
  ];
}