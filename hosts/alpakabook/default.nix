{ config, pkgs, ...}:

{
  imports = [
    ./hardware-configuration.nix
    ./configuration.nix
    ./alpakabook.nix

    # desktop env
    ../../modules/gnome
  ]
}
