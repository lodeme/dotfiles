{ pkgs, config, ... }:

{
  programs.git = {
      enable = true;
      config = {
          userName = "lodeme";
          userEmail = "61187384+lodeme@users.noreply.github.com";
        };
    };
}
