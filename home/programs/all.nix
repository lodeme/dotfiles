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
    fishPlugins.tide
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
    fish
    zoxide
    fzf
    tree
    neofetch
  ];

  programs.fish = {
      enable = true;            # Enable Fish shell management via Home Manager
      interactiveShellInit = "neofetch";
      shellInit = "tide configure --auto --style=Lean --prompt_colors='16 colors' --show_time='24-hour format' --lean_prompt_height='Two lines' --prompt_connection=Solid --prompt_spacing=Sparse --icons='Few icons' --transient=No";
      shellAliases = {
          v = "nvim";
          lg = "lazygit";
          fzd = "cd $(fd --type directory | fzf)";
          gs = "git status";
          gfs = "git fetch && git status";
          ls = "eza --all";
          ll = "eza --long -all";
          rebuild = "sudo nixos-rebuild --flake /home/louis/.dotfiles/nixos/ --impure --show-trace switch";
        };
    };

programs.zoxide = {
  enable = true;
  enableFishIntegration = true;
  };

programs.alacritty = {
  enable = true;
  settings = {
  terminal.osc52 = "CopyPaste";

  font = {
    size = 18.0;
    normal = {
      family = "JetBrainsMonoNL Nerd Font Mono";
      style = "Regular";
    }; bold = {
      family = "JetBrainsMonoNL Nerd Font Mono";
      style = "Bold";
    };
    italic = {
      family = "JetBrainsMonoNL Nerd Font Mono";
      style = "Italic";
    };
    bold_italic = {
      family = "JetBrainsMonoNL Nerd Font Mono";
      style = "Bold Italic";
    };
  };

  colors = {
    primary = {
      background = "#232136";
      foreground = "#e0def4";
    };
    cursor = {
      text = "#e0def4";
      cursor = "#56526e";
    };
    vi_mode_cursor = {
      text = "#e0def4";
      cursor = "#56526e";
    };
    selection = {
      text = "#e0def4";
      background = "#44415a";
    };
    normal = {
      black = "#393552";
      red = "#eb6f92";
      green = "#3e8fb0";
      yellow = "#f6c177";
      blue = "#9ccfd8";
      magenta = "#c4a7e7";
      cyan = "#ea9a97";
      white = "#e0def4";
    };
    bright = {
      black = "#6e6a86";
      red = "#eb6f92";
      green = "#3e8fb0";
      yellow = "#f6c177";
      blue = "#9ccfd8";
      magenta = "#c4a7e7";
      cyan = "#ea9a97";
      white = "#e0def4";
    };
    hints = {
      start = { foreground = "#908caa"; background = "#2a273f"; };
      end = { foreground = "#6e6a86"; background = "#2a273f"; };
    };
  };
  };

};
}
