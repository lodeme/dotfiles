{ config, pkgs, lib, ... }:

{
  home.activation.cleanupHyprlandDir = lib.hm.dag.entryBefore ["writeBoundary"] ''
    # Remove the existing directory if it exists
    if [ -d $HOME/.config/hypr ]; then
      rm -rf $HOME/.config/hypr
    fi
    # Create a fresh directory
    mkdir -p $HOME/.config/hypr
  '';

  home.file.".config/hypr/start.sh".source = ./start.sh;
  home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;
}

