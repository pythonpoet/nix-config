{
  # Add nixos-hardware to inputs
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = { self, nixpkgs, nixos-hardware, ...}:
  {
    # Nixos configurations
    nixosConfigurations = {
      # David's surfacebook 1
      alpakabook = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        mudules = [
          ./configuration.nix
          nixos-hardware.nixosModules.microsoft-surface-common
        ];
      };
    };
  };
}
