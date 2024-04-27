{ pkgs, config, ... }:

{
  programs.git = {
      enable = true;
      config = {
          user.name = "lodeme";
          user.email = "61187384+lodeme@users.noreply.github.com";
          core.editor = "nvim";
          color.ui = "auto";
        };
    };
}
