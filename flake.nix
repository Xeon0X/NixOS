{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager = {
            url = "github:nix-community/home-manager/release-25.05";
            inputs.nixpkgs.follows = "nixpkgs";  # Follows stable nixpkgs by default
        };
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    zen-browser = {
        url = "github:0xc000022070/zen-browser-flake";
        # IMPORTANT: we're using "libgbm" and is only available in unstable so ensure
        # to have it up-to-date or simply don't specify the nixpkgs input
        inputs.nixpkgs.follows = "nixpkgs";
      };
  };
  outputs = {
    self,
    nixpkgs,
    nixos-hardware,
    home-manager,
    zen-browser,
    ...
  } @ inputs: {
    nixosConfigurations.nixos =
      nixpkgs.lib.nixosSystem
      {
        modules = [
          ./configuration.nix
          nixos-hardware.nixosModules.microsoft-surface-common
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.xeon0x = import ./home.nix;
            home-manager.extraSpecialArgs = { inherit inputs; system = "x86_64-linux";};
          }
        ];
        specialArgs = {inherit inputs;};
      };
  };
}
