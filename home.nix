{
  unstable,
  pkgs,
  lib,
  system,
  inputs,
  ...
}: {
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "xeon0x";
  home.homeDirectory = "/home/xeon0x";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;

  imports = [
    ./programs
    # inputs.zen-browser.homeModules.beta
    inputs.zen-browser.homeModules.twilight
    # inputs.zen-browser.homeModules.twilight-official
  ];
}
