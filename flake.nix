{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-vite-plus = {
      url = "github:ryoppippi/nix-vite-plus";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agent-skills = {
      url = "github:Kyure-A/agent-skills-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    slidev-skills = {
      url = "github:slidevjs/slidev";
      flake = false;
    };
  };

  outputs = { nixpkgs, nix-vite-plus, agent-skills, slidev-skills, ... }:
    let
      forAllSystems = nixpkgs.lib.genAttrs (builtins.attrNames nix-vite-plus.packages);

      agentLib = agent-skills.lib.agent-skills;
      sources.slidev = {
        path = slidev-skills;
        subdir = "skills";
      };
      selection = agentLib.selectSkills {
        inherit sources;
        catalog = agentLib.discoverCatalog sources;
        allowlist = [ "slidev" ];
      };
    in
    {
      devShells = forAllSystems (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          bundle = agentLib.mkBundle { inherit pkgs selection; };
          localTargets.claude = agentLib.defaultLocalTargets.claude // { enable = true; };
        in
        {
          default = pkgs.mkShell {
            packages = [
              pkgs.nodejs-slim_24
              pkgs.pnpm
              nix-vite-plus.packages.${system}.default
            ];

            PLAYWRIGHT_BROWSERS_PATH = "${pkgs.playwright-driver.browsers}";
            PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD = "1";
            PLAYWRIGHT_SKIP_VALIDATE_HOST_REQUIREMENTS = "true";

            shellHook = agentLib.mkShellHook { inherit pkgs bundle; targets = localTargets; };
          };
        });
    };
}
