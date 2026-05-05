{ pkgs, ... }:
{
  home.packages = with pkgs; [
    obsidian
    libreoffice
    rnote
    prismlauncher
    keepassxc
    inkscape
    jetbrains.idea-oss
    # vdhcoapp
    # worldpainter
    # jmc2obj
    # kicad
    nextcloud-client
  ];
}
