{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gnomeExtensions.tray-icons-reloaded
    gnomeExtensions.launch-new-instance
    gnomeExtensions.light-style
    gnomeExtensions.system-monitor
    gnomeExtensions.night-theme-switcher
    gnomeExtensions.tiling-shell
    gnomeExtensions.blur-my-shell
    gnomeExtensions.luminus-desktop-y
    gnomeExtensions.vitals
  ];
}
