{ pkgs, ... }:
{
  home.packages = with pkgs; [
    obsidian
    libreoffice
    rnote
    prismlauncher
    keepassxc
    orca-slicer
    jdk # required for zed java extension
    python3 # required for zed java extension
    inkscape
    jetbrains.idea-community
    # vdhcoapp
    # worldpainter
    # jmc2obj
    freecad
    kicad
    nextcloud-client
  ];
}
