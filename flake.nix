{
  description = "Description for the project";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    git-hooks-nix.url = "github:cachix/git-hooks.nix";

    released-nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    released-nixpkgs-stable.url = "nixpkgs/nixos-24.11";
    released-nix-unstable.url = "github:nixos/nix/master";
    released-nix-stable.url = "github:nixos/nix/latest-release";
    nix-pills.url = "github:NixOS/nix-pills";
    nix-pills.flake = false;
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
      ];
      systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];
      perSystem = { config, self', inputs', pkgs, system, ... }: {
        packages.default = pkgs.hello;
      };
      flake = {
      };
    };
}
