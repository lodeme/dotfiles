{ config, pkgs, lib, ... }:

{
  home.activation.cleanupWaybarDir = lib.hm.dag.entryBefore ["writeBoundary"] ''
    # Remove the existing directory if it exists
    if [ -d $HOME/.config/waybar ]; then
      rm -rf $HOME/.config/waybar
    fi
  '';

  home.file.".config/waybar".source = ../waybar;
}

