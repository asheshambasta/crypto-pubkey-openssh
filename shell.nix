args@
  { sources ? import ./nix/sources.nix
  , optimize ? false
  , haddocks ? false
  , failOnWarnings ? true
  , ...
  }:
let
  release = import ./release.nix args;
  nixpkgs = import sources.nixpkgs { };
in nixpkgs.haskellPackages.shellFor {
  withHoogle = haddocks;
  packages = p: builtins.attrValues release;
  buildInputs =
    with nixpkgs.haskellPackages; [ghcid hlint];
}
