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

      programs.vscode = {
      enable = true;
      package = pkgs.vscode.fhs;

      userSettings = {
        "[markdown]" = {
          "editor.defaultFormatter" = "DavidAnson.vscode-markdownlint";
        };
        "files.autoSave" = "afterDelay";
        "files.autoSaveDelay" = 1000;
        "workbench.colorTheme" = "GitHub Dark Dimmed"; # Celestial | Ayu Dark | Correia Gruvbox Theme
        "workbench.tree.indent" = 20;
        "editor.cursorSmoothCaretAnimation" = "on";
        "editor.inlineSuggest.suppressSuggestions" = false;
        # "workbench.colorTheme" = "";
      };

      extensions =
        with pkgs.vscode-extensions;
          [
            # THEMES
            dracula-theme.theme-dracula
            github.github-vscode-theme

            # GIT
            eamodio.gitlens
            github.vscode-pull-request-github
            github.vscode-github-actions
            github.codespaces

            ## WAKATIME
            wakatime.vscode-wakatime

            ## TODO
            gruntfuggly.todo-tree

            # VIM
            vscodevim.vim

            # LANGUAGES
            ## NIX
            bbenoist.nix
            jnoortheen.nix-ide

            ## RUST
            rust-lang.rust-analyzer
            serayuzgur.crates
            tamasfe.even-better-toml

            ## ZIG
            # ziglang.vscode-zig

            ## Markdown
            yzhang.markdown-all-in-one
            davidanson.vscode-markdownlint

            ## C/C++
            ms-vscode.cpptools

            # Debuggers
            vadimcn.vscode-lldb # C/C++ Rust

            ## CMAKE
            ms-vscode.cmake-tools

          ]
        ;
    };


  imports = [
    ./packages.nix
    ./alacritty.nix
    ./fish.nix
    ./git.nix
    ./nvim/nvim.nix
    ./hypr/hypr.nix
  ];
}

