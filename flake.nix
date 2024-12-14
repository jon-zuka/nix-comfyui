{
  inputs = { nixpkgs = { url = "nixpkgs"; }; };

  outputs = { self, nixpkgs }:
    let
      supportedSystems = [ "x86_64-linux" ];
      config = {
        allowUnfree = true;
      };
      forEachSupportedSystem = f:
        nixpkgs.lib.genAttrs supportedSystems
        (system: f { pkgs = import nixpkgs { inherit system config; }; });
    in {
      devShells = forEachSupportedSystem ({ pkgs }: {
        default =
          pkgs.mkShell { packages = pkgs.callPackage ./packages/comfyui { }; };
      });
    };
}
