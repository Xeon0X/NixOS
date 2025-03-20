{
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;
    nixos-hardware.url = github:NixOS/nixos-hardware/master;
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = {
    self,
    nixpkgs,
    nixos-hardware,
    home-manager
  }: {
    nixosConfigurations.xeon0x-desktop = nixpkgs.lib.nixosSystem {
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
    };
  };
}
