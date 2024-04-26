{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    fish
    zoxide
    fishPlugins.tide
  ]

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
