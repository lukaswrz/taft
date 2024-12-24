{
  description = "Fast file transfer utility";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";

    devenv-root = {
      url = "file+file:///dev/null";
      flake = false;
    };
    devenv.url = "github:cachix/devenv";
  };

  outputs = {
    self,
    nixpkgs,
    flake-parts,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [
        inputs.devenv.flakeModule
      ];

      systems = nixpkgs.lib.systems.flakeExposed;

      perSystem = {
        pkgs,
        inputs',
        ...
      }: {
        devenv.shells.default = {
          devenv.root = let
            devenvRootFileContent = builtins.readFile inputs.devenv-root.outPath;
          in
            pkgs.lib.mkIf (devenvRootFileContent != "") devenvRootFileContent;

          name = "taft";

          imports = [
            ./devenv.nix
          ];
        };

        packages.default = pkgs.callPackage ./package.nix {};
      };
    };
}
