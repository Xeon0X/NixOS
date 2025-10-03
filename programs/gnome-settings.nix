{ lib, ... }:
{
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
      text-scaling-factor = 1.05;
      accent-color = "purple";
    };
    "org/gnome/desktop/calendar" = {
      show-weekdate = true;
    };

    # Blur my shell
    # "org/gnome/shell/extensions/blur-my-shell/applications" = {
    #   blur = true;
    #   enable-all = true;
    # };
    "org/gnome/shell/extensions/blur-my-shell/panel" = {
      force-light-text = true;
    };

    # Tiling Shell
    "org/gnome/shell/extensions/tilingshell" = {
      inner-gaps = lib.hm.gvariant.mkUint32 8;
      outer-gaps = lib.hm.gvariant.mkUint32 4;
      tile-preview-animation-time = lib.hm.gvariant.mkUint32 200;
      snap-assistant-animation-time = lib.hm.gvariant.mkUint32 200;
      enable-autotiling = true;
      top-edge-maximize = true;
      quarter-tiling-threshold = lib.hm.gvariant.mkUint32 20;
    };

    # Vitals
    "org/gnome/shell/extensions/vitals" = {
      icon-style = 1;
      update-time = 1;
      show-gpu = true;
      use-higher-precision = false;
      hot-sensors = [
        "_system_uptime_"
        "_processor_usage_"
        "_memory_usage_"
        # "_storage_used_"
        "_temperature_gpu_"
        "_fan_gpu_"
        "_gpu#1_utilization_"
        "_gpu#1_power_"
        "_gpu#1_memory_reserved_"
      ];
    };

    "org/gnome/settings-daemon/plugins/power" = {
      sleep-inactive-ac-type = "nothing";
    };

    "org/gnome/shell" = {
      disable-user-extensions = false;

      # gnome-extensions list
      enabled-extensions = [
        "trayIconsReloaded@selfmade.pl"
        "launch-new-instance@gnome-shell-extensions.gcampax.github.com"
        "light-style@gnome-shell-extensions.gcampax.github.com"
        # "system-monitor@gnome-shell-extensions.gcampax.github.com"
        "nightthemeswitcher@romainvigier.fr"
        "tilingshell@ferrarodomenico.com"
        "blur-my-shell@aunetx"
        # "luminus-desktop-y@dikasp.gitlab"
        # "burn-my-windows@schneegans.github.com"
        # "restartto@tiagoporsch.github.io"
        "Vitals@CoreCoding.com"
      ];

      disabled-extensions = [
      ];
    };

    "org/gnome/Console/custom-font" = {
      value = "Cascadia Code 14";
    };

    "org/gnome/Console/use-system-font" = {
      value = false;
    };
  };
}
