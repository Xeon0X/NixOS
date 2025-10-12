{ ... }:
{
  imports = [
    ./zed-editor.nix
    ./zen-browser.nix
    ./zsh.nix
    ./zoxide.nix
    ./gnome-extensions.nix
    ./gnome-settings.nix
    ./firefox.nix
    ./git.nix
    ./others.nix
  ];

  # autostart some apps
  # from https://forge.onyx.ovh/eymeric/flake/src/branch/main/apps/plasma/default.nix
  home.file.".config/autostart/" = {
    source = ./autostart;
    force = true;
    recursive = true;
  };
}
