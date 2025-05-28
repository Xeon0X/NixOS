{lib, ...}: {
  # dconf watch /
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      enable-hot-corners = false;
    };
    "org/gnome/mutter" = {
      dynamic-workspaces = true;
    };
    "org/gnome/desktop/datetime" = {
      automatic-timezone = true;
    };
    "org/gnome/desktop/interface" = {
      clock-show-weekday = true;
      clock-show-seconds = true;
    };
    "org/gnome/desktop/calendar" = {
      show-weekdate = true;
    };
    "org/gnome/desktop/interface" = {
      accent-color = "purple";
    };

    "org/gnome/shell/extensions/tilingshell" = {
      inner-gaps = lib.hm.gvariant.mkUint32 8;
      outer-gaps = lib.hm.gvariant.mkUint32 4;
      enable-autotiling = true;
    };

    "org/gnome/shell" = {
      disable-user-extensions = false;

      # gnome-extensions list
      enabled-extensions = [
        "trayIconsReloaded@selfmade.pl"
        "launch-new-instance@gnome-shell-extensions.gcampax.github.com"
        # "light-style@gnome-shell-extensions.gcampax.github.com"
        "system-monitor@gnome-shell-extensions.gcampax.github.com"
        "nightthemeswitcher@romainvigier.fr"
        "tilingshell@ferrarodomenico.com"
        "blur-my-shell@aunetx"
        "luminus-desktop-y@dikasp.gitlab"
        "burn-my-windows@schneegans.github.com"
        "restartto@tiagoporsch.github.io"
      ];

      disabled-extensions = [
      ];
    };
  };
}
