{
  inputs.nixpkgs.url = "git+ssh://git@github.com/NixOS/nixpkgs.git?ref=nixos-unstable";
  outputs =
    { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      formatter.${system} = pkgs.treefmt.withConfig {
        settings.formatter.air = {
          command = "${pkgs.air-formatter}/bin/air";
          options = [ "format" ];
          includes = [
            "*.R"
            "*.r"
          ];
        };
        settings.formatter.nixfmt = {
          command = "${pkgs.nixfmt}/bin/nixfmt";
          includes = [ "*.nix" ];
        };
      };

      devShells.${system}.default = pkgs.mkShellNoCC {
        packages = [
          (pkgs.rWrapper.override {
            packages = [
              pkgs.rPackages.ggplot2
              pkgs.rPackages.svglite
            ];
          })
        ];
      };
    };
}
