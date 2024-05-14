{ pkgs, ... }: {

  programs.vscode = {
  enable = true;
  package = pkgs.vscode.fhs;
  userSettings = {
    "[markdown]" = {
      "editor.defaultFormatter" = "DavidAnson.vscode-markdownlint";
    };
    "files.autoSave" = "afterDelay";
    "files.autoSaveDelay" = 500;
    "workbench.colorTheme" = "Gruvbox Dark Medium"; # Celestial | Ayu Dark | Correia Gruvbox Theme
    "workbench.tree.indent" = 20;
    "editor.cursorSmoothCaretAnimation" = "on";
    "editor.inlineSuggest.suppressSuggestions" = false;
    "workbench.panel.defaultLocation" = "right";
    "editor.cursorSurroundingLines" = 10;
    "editor.rulers" = [ 80 88 ];
    "editor.fontFamily" = "Fira Code";
    "editor.fontWeight" = 500;
    "editor.fontLigatures" = true;
    "git.confirmSync" = false;
    "git.autofetch" = true;
    "extensions.ignoreRecommendations" = true;
  };
  extensions =
    with pkgs.vscode-extensions;
      [
        # THEMES
        jdinhlife.gruvbox

        # GIT
        mhutchie.git-graph
        github.vscode-pull-request-github
        github.vscode-github-actions
        github.codespaces

        ## TODO
        gruntfuggly.todo-tree

        # VIM
        vscodevim.vim

        # LANGUAGES
        ## NIX
        bbenoist.nix
        jnoortheen.nix-ide

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

