# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
let
  GERMAN = "de_DE.UTF-8";
  ENGLISH = "en_US.UTF-8";
  addUTF8 = str: "${str}/UTF-8";
  englishLocale = addUTF8 ENGLISH;
  GermanLocale = addUTF8 GERMAN;
in {

  i18n.supportedLocales = [ englishLocale GermanLocale ];
  i18n.defaultLocale = ENGLISH;
  i18n.extraLocaleSettings = {
  LC_MESSAGES = "en_US.UTF-8";
  LC_TIME = "de_DE.UTF-8";
};
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "ch";
    variant = "legacy";
  };

  # Configure console keymap
  console.keyMap = "sg";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  
}
