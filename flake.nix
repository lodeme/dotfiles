{
  description = "NixOS configuration as a flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvim-nix = {
      url = "github:lodeme/flake.nvim";
      # url = "path:~/.dotfiles/home/programs/nvim/";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

    outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    ...
  }: let
    system = "x86_64-linux";
    lib = nixpkgs.lib;

    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
      };
      overlays = [
        inputs.nvim-nix.overlays.${system}.default
      ];
    };
  in {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./nixos/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.louis = import ./home/users/louis/home.nix;
            home-manager.extraSpecialArgs = { inherit pkgs; };
          }
        ];
      };
    };
  };
}
