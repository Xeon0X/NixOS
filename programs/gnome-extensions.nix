{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gnomeExtensions.tray-icons-reloaded
    gnomeExtensions.launch-new-instance
    gnomeExtensions.light-style
    gnomeExtensions.night-theme-switcher
    gnomeExtensions.tiling-shell
    gnomeExtensions.blur-my-shell
    gnomeExtensions.vitals
  ];
}
