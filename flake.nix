{
  # Add nixos-hardware to inputs
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@ { self, nixpkgs, nixos-hardware, home-manager, ...}:
  let
    # Define the shell environment
    shell = import ./hosts/alpakabook/shell.nix {
      inherit (nixpkgs) pkgs;
    };
  in
  {
    # Nixos configurations
    nixosConfigurations = {
      # David's surfacebook 1
      alpakabook = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          nixos-hardware.nixosModules.microsoft-surface-common
          ./hosts/alpakabook
         
        #  home-manager.nixosModules.home-manager
        #  {
        #    home-manager.useGlobalPkgs = true;
        #    home-manager.useUserPackages = true;

        #     home-manager.extraSpecialArgs = inputs;
        #    home-manager.users.david = import ./home-manager/hyperland.nix;
        #  }
        ];
         
        #devShells.x86_64-linux.default = shell;
       # microsoft-surface.surface-control.enable = true;
      };
    };
    devShells = {
      x86_64-linux.default = shell;
    };
  };
}
