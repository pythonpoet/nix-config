{ config, pkgs, ...}:

{
 # Prerequisits:
  environment.systemPackages = with pkgs; [ 
    python312 
    python312Packages.dbus-python
    openssl
  ];
  # Run python main.py manually
}
