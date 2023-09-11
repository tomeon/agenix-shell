{
  description = "A flake-parts module for including secrets in shells";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} ({lib, ...}: {
      systems = lib.systems.flakeExposed;

      imports = [
        ./templates
        ./flakeModules
        ./formatting
        ./checks
      ];
    });
}
