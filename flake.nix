{
  inputs = { nixpkgs = { url = "nixpkgs"; }; };

  outputs = { self, nixpkgs }:
    let
      supportedSystems = [ "x86_64-linux" ];
      config = { allowUnfree = true; };
      forEachSupportedSystem = f:
        nixpkgs.lib.genAttrs supportedSystems
        (system: f { pkgs = import nixpkgs { inherit system config; }; });
    in {
      devShells = forEachSupportedSystem ({ pkgs }:
        let comfyuiPkgs = pkgs.callPackage ./packages/comfyui { };
        in {
          default = pkgs.mkShell {
            packages = comfyuiPkgs;
            shellHook = ''
              export NIX_COMFYUI_DATA="$(pwd)/data"
            '';
          };
        });
    };
}
