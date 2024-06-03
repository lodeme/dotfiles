{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # apps
    thunderbird
    protonmail-bridge
    beeper
    pass
    libsForQt5.okular #pdfs
    calibre
    gnome-multi-writer #USB flashing utility

    # coding
    git
    luarocks
    cmake
    cargo
    tcsh
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
    gnupg1orig # generate gpg keys
  ];

  programs.bat = {
    enable = true;
    config = {
      theme = "base16";
    };
  };
}
