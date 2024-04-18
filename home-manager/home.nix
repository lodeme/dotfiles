{ config, pkgs, ... }:

{
  home.username = "louis";
  home.homeDirectory = "/home/louis";

  home.packages = with pkgs; [
    # coding
    neovim
    git
    luarocks
    cmake
    cargo
    llvmPackages_latest.llvm
    python3
    nodejs
    sqlite
    bear
    pipx
    norminette
    lua54Packages.jsregexp

    # utils
    curl
    lazygit
    bat
    eza
    tlrc
    nnn
    zellij
    openssh
    wget
    btop
    ripgrep
    fd
    unzip
    fish
    zoxide
    fzf
    tree
    neofetch
  ];

programs.alacritty = {
  enable = true;
};

home.stateVersion = "23.11";
programs.home-manager.enable = true;

}
