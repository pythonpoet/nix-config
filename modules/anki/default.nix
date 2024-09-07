{config, pkgs, ...}:

{
 # Install anki
 environment.systemPackages = [
  pkgs.anki-bin
  pkgs.cargo 
  pkgs.rustc
]; 

}
