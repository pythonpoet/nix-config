{ config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [ 
    surface-control
    libcamera
    python312
    python312Packages.pip 
    python312Packages.pydbus
   # libcamera-tools
    #cam
    #qcam
   # gst-plugin-libcamera
  ];
  # Enable surface-control
  #microsoft-surface.surface-control.enable = true;
 # config.microsoft-surface.ipts.enable = true;
}
