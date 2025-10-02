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
    # vdhcoapp
    worldpainter
    jmc2obj
    freecad
    openrgb-with-all-plugins
    ledfx
    hyperhdr
    ffmpeg-full
    # mpv
    vlc
    davinci-resolve
    tor-browser
    audacity
    jmc2obj
  ];
}
