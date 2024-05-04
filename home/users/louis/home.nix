{ pkgs, ... }:

{
  programs.home-manager.enable = true;
  home.stateVersion = "23.11";
  home.username = "louis";
  home.homeDirectory = "/home/louis";

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.packages = with pkgs; [
    nixpkgs-fmt
  ];

  imports = [
    ../../programs/packages.nix
    ../../programs/alacritty.nix
    ../../programs/fish.nix
    ../../programs/git.nix
  ];
}

