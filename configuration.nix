# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  pkgs,
  lib,
  inputs,
  ...
}:
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./nvidia-configuration.nix
    ./disko-configuration.nix
  ];

  # Bootloader.
  # boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Lanzaboote currently replaces the systemd-boot module.
  # This setting is usually set to true in configuration.nix
  # generated at installation time. So we force it to false
  # for now.
  boot.loader.systemd-boot.enable = lib.mkForce false;
  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/var/lib/sbctl";
  };

  networking.hostName = "nixos-laptop"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  fonts.fontconfig.antialias = true;
  fonts.fontconfig.hinting.enable = true;
  fonts.fontconfig.hinting.autohint = true;
  fonts.fontconfig.hinting.style = "slight";
  fonts.fontconfig.subpixel.rgba = "rgb";

  fonts.packages = with pkgs; [
    cascadia-code
    minecraftia
  ];

  # Custom config for touchscreen
  services.xserver.wacom.enable = true;
  services.iptsd.enable = true;
  services.iptsd.config.Touchscreen = {
    DisableOnStylus = true;
    DisableOnPalm = true;
  };
  environment.etc."libinput/local-overrides.quirks".text = pkgs.lib.mkForce ''
    [Microsoft Surface Laptop Studio Touchpad]
    MatchVendor=0x045E
    MatchProduct=0x09AF
    MatchUdevType=touchpad
    AttrPressureRange=2:1
    AttrPalmPressureThreshold=500
    AttrEventCode=-REL_WHEEL_HI_RES;-REL_HWHEEL_HI_RES;
  '';

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # GNOME Configuration
  programs.dconf.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "fr";
    variant = "azerty";
  };

  # Configure console keymap
  console.keyMap = "fr";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  users.users.xeon0x = {
    isNormalUser = true;
    description = "Xeon0X";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
  };

  # Install firefox.
  # programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      (
        self: super:
        let
          unstable = import inputs.nixpkgs-unstable {
            config = super.config;
            system = super.system;
          };
        in
        {
          zed-editor = unstable.zed-editor;
          worldpainter = unstable.worldpainter;
        }
      )

      inputs.blender-bin.overlays.default
    ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    blender_4_5
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    btop
    wget
    # alejandra
    libwacom-surface
    surface-control
    gnome-software
    nixd
    nil
    gnome-tweaks
    gnome-extension-manager
    input-leap
    nextcloud-client
    nixfmt-rfc-style
    vulkan-loader
    vulkan-validation-layers
    vulkan-tools
    sbctl # For Lanzaboote
  ];

  virtualisation.docker = {
    enable = true;
  };

  services.thermald.enable = true;
  services.flatpak.enable = true;

  programs.zsh = {
    enable = true;
    #   enableCompletion = true;
    #   autosuggestions.enable = true;
    #   syntaxHighlighting.enable = true;

    #   shellAliases = {
    #     ll = "ls -l";
    #     nix-rebuild = "sudo nixos-rebuild switch --flake .#nixos-laptop --show-trace";
    #     nix-setting = "dconf watch /";
    #     nix-clean = "sudo nix-collect-garbage -d";
    #     nix-update = "sudo nix flake update";
    #   };

    #   shellInit = ''
    #     nix-quick(){
    #       ${lib.getExe pkgs.nix} flake init --template "https://flakehub.com/f/the-nix-way/dev-templates/*#$1"
    #   }
    #   '';

    #   ohMyZsh = {
    #     enable = true;
    #     plugins = [
    #       "git"
    #       "python"
    #       "man"
    #     ];
    #     theme = "robbyrussell";
    #   };
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    loadInNixShell = true;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 24800 ];
  networking.firewall.allowedUDPPorts = [ 24800 ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # Add keyboard driver for unlocking with disk encryption
  boot.initrd.kernelModules = [
    "pinctrl_tigerlake"
    "8250_dw"
    "surface_aggregator"
    "surface_aggregator_registry"
    "surface_aggregator_hub"
    "surface_hid_core"
    "surface_hid"
  ];
}
