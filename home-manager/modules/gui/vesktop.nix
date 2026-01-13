{ pkgs, ... }: 
  let
    # Правильный способ обернуть Vesktop, сохранив метод .override
    customVesktop = pkgs.vesktop.overrideAttrs (oldAttrs: {
      nativeBuildInputs = (oldAttrs.nativeBuildInputs or []) ++ [ pkgs.makeWrapper ];
      postFixup = (oldAttrs.postFixup or "") + ''
        wrapProgram $out/bin/vesktop \
          --add-flags "--proxy-server=socks5://127.0.0.1:1080" \
          --add-flags "--disable-quic"
      '';
    });
  in
  {
  nixpkgs.config.allowUnfree = true;

  programs.vesktop = {
    enable = true;
    package = customVesktop;
    settings = {
      appBadge = true;
      arRPC = true;
      checkUpdates = true;
      customTitleBar = false;
      disableMinSize = true;
      minimizeToTray = true;
      tray = true;
      hardwareAcceleration = true;
      discordBranch = "stable";
      plugins = {
        MessageLogger = {
          enabled = true;
          ignoreSelf = true;
        };
        FakeNitro.enabled = true;
        AnonymiseFileNames.enable = true;
        BetterSessions.enable = true;
        BetterSettings.enable = true;
        CallTimer.enable = true;
        ClearURLs.enable = true;
        CustomRPC.enable = true;
        CustomIdle.enable = true;
        DisableCallIdle = true;
        FavoriteEmojiFirst.enable = true;
        FixImagesQuality.enable = true;
        FixYoutubeEmbeds.enable = true;
        FriendsSince.enable = true;
        GameActivityToggle.enable = true;
        GifPaste.enable = true;
        ImageZoom.enable = true;
        KeepCurrentChannel.enable = true;
        LastFMRichPresence.enable = true;
        MessageLatency.enable = true;
        ReadAllNotificationsButton.enable = true;
        YoutubeAdblock.enable = true;
        VolumeBooster.enable = true;
        Unindent.enable = true;
        NotTypingAnimation.enable = true;
        SilentTyping.enable = true;
      };
    };
  };
}