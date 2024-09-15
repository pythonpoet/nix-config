{config, pkgs, ...}:

#let openssl_wr = pkgs.symlinkJoin "openssl-dev-out" (with pkgs; [ openssl.dev openssl.out ]);
#in
{
  environment.systemPackages = with pkgs;[
   anki-bin

   # do Anki sysbet thingy
   cargo
   rustc
   gcc
   pkg-config
   libiconv
   openssl
   zip
   unzip
 # vcpkg
 # rust-bindgen
  ];
  # nixpkgs.config.permittedInsecurePackages = [
  #              "openssl-1.1.1w"
  #            ];

}
