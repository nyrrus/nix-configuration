{ config, pkgs, ... }: 
{
    programs.firefox = {
      enable = true;
      profiles = {
        default = {
          id = 0;
          name = "default";
          isDefault = true;

          extensions = with pkgs.nur.repos.rycee.firefox-addons; [
            ublock-origin
            sponsorblock
            darkreader
            tampermonkey
            foxyproxy-standard
            i-dont-care-about-cookies
          ];

          settings = {
            "browser.newtabpage.activity-stream.feeds.telemetry" = false;
            "browser.newtabpage.activity-stream.telemetry" = false;
            "browser.ping-centre.telemetry" = false;
            "toolkit.telemetry.archive.enabled" = false;
            "toolkit.telemetry.bhrPing.enabled" = false;
            "toolkit.telemetry.enabled" = false;
            "toolkit.telemetry.firstShutdownPing.enabled" = false;
            "toolkit.telemetry.hybridContent.enabled" = false;
            "toolkit.telemetry.newProfilePing.enabled" = false;
            "toolkit.telemetry.reportingpolicy.firstRun" = false;
            "toolkit.telemetry.shutdownPingSender.enabled" = false;
            "toolkit.telemetry.unified" = false;
            "toolkit.telemetry.updatePing.enabled" = false;
            "privacy.trackingprotection.enabled" = true;
            "privacy.trackingprotection.socialtracking.enabled" = true;
            "privacy.donottrackheader.enabled" = true;
            "network.cookie.cookieBehavior" = 1;
            "network.http.referer.spoofSource" = true;
            "beacon.enabled" = false;
            "browser.uiCustomization.state" = ''{"placements":{"widget-overflow-fixed-list":[],"nav-bar":["back-button","forward-button","stop-reload-button","home-button","urlbar-container","downloads-button","library-button","ublock0_raymondhill_net-browser-action","_testpilot-containers-browser-action"],"toolbar-menubar":["menubar-items"],"TabsToolbar":["tabbrowser-tabs","new-tab-button","alltabs-button"],"PersonalToolbar":["import-button","personal-bookmarks"]},"seen":["save-to-pocket-button","developer-button","ublock0_raymondhill_net-browser-action","_testpilot-containers-browser-action"],"dirtyAreaCache":["nav-bar","PersonalToolbar","toolbar-menubar","TabsToolbar","widget-overflow-fixed-list"],"currentVersion":18,"newElementCount":4}'';
            "dom.security.https_only_mode" = true;
            "identity.fxaccounts.enabled" = false;
            "signon.rememberSignons" = false;
            # "network.proxy.type" = 1;
            # "network.proxy.http" = "127.0.0.1";
            # "network.proxy.http_port" = 8080;
            # "network.proxy.ssl" = "127.0.0.1";
            # "network.proxy.ssl_port" = 8080;
            # "network.proxy.ftp" = "127.0.0.1";
            # "network.proxy.ftp_port" = 8080;
            # "network.proxy.no_proxies_on" = "localhost, 127.0.0.1";
          };
        };
      };
    };
}