{ config, pkgs, ... }:

{
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
    kubectl

    # utils
    curl
    lazygit
    bat		# cat with better formatting
    eza		# ls with colors
    tlrc
    nnn		# file browser in terminal
    xclip
    atuin	# search commands history
    zellij	# terminal multiplexer
    openssh
    wget
    btop
    ripgrep	# search recursively for text in files
    fd
    unzip
    fzf
    tree
    neofetch
  ];
}
