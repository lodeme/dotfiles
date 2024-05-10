{ config, pkgs, lib, ... }:

{
  home.activation.cleanupWaybarDir = lib.hm.dag.entryBefore ["writeBoundary"] ''
    # Remove the existing directory if it exists
    if [ -d $HOME/.config/waybar ]; then
      rm -rf $HOME/.config/waybar
    fi
    # Create a fresh directory
    mkdir -p $HOME/.config/waybar
  '';

  home.file.".config/waybar/config".source = ./config;
  home.file.".config/waybar/modules.json".source = ./modules.json;
  home.file.".config/waybar/style.css".source = ./style.css;
}

