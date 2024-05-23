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
    ./packages.nix
    ./alacritty.nix
    ./fish.nix
    ./git.nix
    ./nvim/nvim.nix
    ./hypr/hypr.nix
    ./hypr/waybar/waybar.nix
    ./vscode.nix
    ./mako.nix
  ];
}

