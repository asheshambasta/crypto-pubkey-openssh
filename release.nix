args@
  { sources ? import ./nix/sources.nix
  , optimize ? false
  , haddocks ? false
  , failOnWarnings ? false # FIXME
  , ...
  }:
let

  overlays = [];
  nixpkgs-overlayed = import sources.nixpkgs { inherit overlays; };

in { crypto-pubkey-openssh = nixpkgs-overlayed.haskellPackages.callCabal2nix "crypto-pubkey-openssh" ./. {};  }
