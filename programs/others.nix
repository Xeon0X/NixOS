{ pkgs, ... }:
{
  home.packages = with pkgs; [
    obsidian
    libreoffice
    rnote
    prismlauncher
    keepassxc
    orca-slicer
    inkscape
    jetbrains.idea-oss
    # vdhcoapp
    # worldpainter
    # jmc2obj
    # kicad
    nextcloud-client
  ];
}
