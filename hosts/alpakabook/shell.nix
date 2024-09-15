{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
nativeBuildInputs = with pkgs; [ rustc cargo gcc rustfmt clippy ];


  shellHook = ''
 #   export OPENSSL_DIR="${pkgs.openssl}"
    export OPENSSL_INCLUDE_DIR="${pkgs.openssl.dev}/include"
    export OPENSSL_LIB_DIR="${pkgs.openssl.dev}/lib"
    export PKG_CONFIG_PATH="${pkgs.openssl.dev}/lib/pkgconfig"
 #   export LIBRARY_PATH="${pkgs.openssl.dev}/lib":"$LIBRARY_PATH"
   export OPENSSL_STATIC=0
  '';
}

