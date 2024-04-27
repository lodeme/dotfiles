{ pkgs, config, ... }:

{
  programs.git = {
      enable = true;
      config = {
          user.name = "lodeme";
          user.email = "61187384+lodeme@users.noreply.github.com";
          user.editor = "nvim";
          user.ui = "auto";
        };
    };
}
