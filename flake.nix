{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager = {
            url = "github:nix-community/home-manager/release-24.11";
            inputs.nixpkgs.follows = "nixpkgs";  # Follows stable nixpkgs by default
        };
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  outputs = {
    self,
    nixpkgs,
    nixos-hardware,
    home-manager,
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
          }
        ];
        specialArgs = {inherit inputs;};
      };
  };
}
