{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.openssl
    pkgs.pkg-config
    pkgs.gcc
  ];

  shellHook = ''
    export OPENSSL_DIR="${pkgs.openssl}/out"
    export OPENSSL_INCLUDE_DIR="$OPENSSL_DIR/include"
    export OPENSSL_LIB_DIR="$OPENSSL_DIR/lib"
    export PKG_CONFIG_PATH="$OPENSSL_DIR/lib/pkgconfig"
  '';
}

