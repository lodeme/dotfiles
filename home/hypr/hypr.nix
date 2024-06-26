{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    catppuccin-cursors.macchiatoSapphire
  ];

  home.activation.cleanupHyprlandDir = lib.hm.dag.entryBefore ["writeBoundary"] ''
    # Remove the existing directory if it exists
    if [ -d $HOME/.config/hypr ]; then
      rm -rf $HOME/.config/hypr
    fi
    # Create a fresh directory
    mkdir -p $HOME/.config/hypr
  '';

  home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;
}

