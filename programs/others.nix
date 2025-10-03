{ pkgs, ... }:
{
  home.packages = with pkgs; [
    obsidian
    libreoffice
    rnote
    prismlauncher
    keepassxc
    # jdk # required for zed java extension
    # python3 # required for zed java extension
    inkscape
    jetbrains.idea-community
    worldpainter
    jmc2obj
    freecad
    openrgb-with-all-plugins
    ledfx
    hyperhdr
    ffmpeg-full
    vlc
    davinci-resolve
    audacity
  ];
}
