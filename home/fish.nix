{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    fish
    zoxide
    fishPlugins.tide
  ];

  programs.fish = {
      enable = true;
      interactiveShellInit = "neofetch";
      shellInit = ''
        tide configure --auto --style=Lean --prompt_colors='16 colors' --show_time='24-hour format' --lean_prompt_height='Two lines' --prompt_connection=Solid --prompt_spacing=Sparse --icons='Few icons' --transient=No
        function devenv
          nix flake init --template github:lodeme/nix-dev-templates#$argv
          direnv allow
        end
      '';
      shellAliases = {
          v = "nvim";
          lg = "lazygit";
          fzd = "cd $(fd --type directory | fzf)";
          gs = "git status";
          gfs = "git fetch && git status";
          ls = "eza --all";
          ll = "eza --long -all";
          rebuild = "sudo nixos-rebuild --flake /home/louis/.dotfiles --impure --show-trace switch";
          rmdevenv = "rm -rf .direnv .envrc flake.lock flake.nix";
        };
    };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
    };
}
