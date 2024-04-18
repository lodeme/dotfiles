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
    bat		# cat with better formatting
    eza		# ls with colors
    tlrc
    nnn		# file browser in terminal
    atuin	# search commands history
    zellij	# terminal multiplexer
    openssh
    wget
    btop
    ripgrep	# search recursively for text in files
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
