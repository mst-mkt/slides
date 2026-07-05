{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-vite-plus.url = "github:ryoppippi/nix-vite-plus";
    nix-vite-plus.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, nix-vite-plus, ... }:
    let
      forAllSystems = nixpkgs.lib.genAttrs (builtins.attrNames nix-vite-plus.packages);
    in
    {
      devShells = forAllSystems (system:
        let pkgs = nixpkgs.legacyPackages.${system};
        in {
          default = pkgs.mkShell {
            packages = [
              pkgs.nodejs-slim_24
              pkgs.pnpm
              nix-vite-plus.packages.${system}.default
            ];
          };
        });
    };
}
