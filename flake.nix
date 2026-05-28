{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  outputs = { nixpkgs, ... }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in {
      devShells.x86_64-linux.default = pkgs.mkShellNoCC {
        shellHook = ''
          fish
        '';
        packages = [
          (pkgs.rWrapper.override {
            packages = [ pkgs.rPackages.ggplot2  pkgs.rPackages.svglite ];
          })
        ];
      };
    };
}
