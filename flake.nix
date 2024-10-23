{
  # Add nixos-hardware to inputs
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    # bonfire dep.
    bonfire.url = "github:bonfire-networks/bonfire-app/main";
    agenix.url = "github:ryantm/agenix";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@ { self, nixpkgs, nixos-hardware, home-manager, bonfire,agenix, ...}:
  let
    # Define the shell environment
    shell = import ./hosts/alpakabook/shell.nix {
      inherit (nixpkgs) pkgs;
    };
    overlay = final: prev: with final;{
      # a package named bonfire already exists on nixpkgs so we put it under a different name
      elixirBonfire = bonfire.packages.x86_64-linux.default;
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
          {
          environment.systemPackages = [ agenix.defaultPackage.x86_64-linux ];
          nixpkgs.overlays = [ self.overlay ];
        }
         
        bonfire.nixosModules.bonfire     
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
