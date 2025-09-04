{ pkgs, lib, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      nix-rebuild = "sudo nixos-rebuild switch --flake .#nixos-laptop --show-trace";
      nix-setting = "dconf watch /";
      nix-clean = "sudo nix-collect-garbage -d";
      nix-update = "sudo nix flake update";
      cd = "z";  # provided by zoxide
    };

    initContent = ''
      nix-quick(){
        ${lib.getExe pkgs.nix} flake init --template "https://flakehub.com/f/the-nix-way/dev-templates/*#$1"
      }
    '';

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "python"
        "man"
      ];
      theme = "robbyrussell";
    };
  };
}
