{ config, pkgs, ...}:

{
  imports = [
    ./hardware-configuration.nix
    ./configuration.nix
        ./alpakabook.nix

    # desktop env
    ../../modules/gnome
    #../../modules/hyperland
    # Apps
    ../../modules/anki

    #shell 
    ./shell.nix
  ];
}
