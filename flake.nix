{
  # Cuda
  nixConfig = {
    substituters = [
      "https://cache.onyx.ovh"
      "https://cache.nixos-cuda.org"
      "https://nix-community.cachix.org"
    ];
    trusted-public-keys = [
      "cache.onyx.ovh:2wUG6wsx5slbKUgkHT6GJuQ5k2StuUc8ysZQ2W+fbxA="
      "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixos-hardware.url = "github:8bitbuddhist/nixos-hardware/surface-kernel-6.18";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs"; # Follows stable nixpkgs by default
    };
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      # IMPORTANT: we're using "libgbm" and is only available in unstable so ensure
      # to have it up-to-date or simply don't specify the nixpkgs input
      inputs.nixpkgs.follows = "nixpkgs";
    };
    blender-bin.url = "github:edolstra/nix-warez?dir=blender";
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v1.0.0";

      # Optional but recommended to limit the size of your system closure.
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs =
    {
      self,
      nixpkgs,
      disko,
      nixos-hardware,
      home-manager,
      zen-browser,
      blender-bin,
      lanzaboote,
      ...
    }@inputs:
    {
      nixosConfigurations.nixos-laptop = nixpkgs.lib.nixosSystem {
        modules = [
          ./configuration.nix
          nixos-hardware.nixosModules.microsoft-surface-common
          home-manager.nixosModules.home-manager
          disko.nixosModules.disko
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.xeon0x = import ./home.nix;
            home-manager.extraSpecialArgs = {
              inherit inputs;
              system = "x86_64-linux";
            };
          }
          lanzaboote.nixosModules.lanzaboote
        ];
        specialArgs = { inherit inputs; };
      };
    };
}
