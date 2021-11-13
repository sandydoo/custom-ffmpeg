{
  description = "A full build of ffmpeg, including the proprietary stuff";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };

        overrides = {
          nonfreeLicensing = true;
          fdkaacExtlib = true;
        };
      in
      rec {
        packages.ffmpeg-custom = pkgs.ffmpeg-full.override overrides;
        defaultPackage = packages.ffmpeg-custom;
      }
    );
}
