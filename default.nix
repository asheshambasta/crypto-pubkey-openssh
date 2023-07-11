args@
  { sources ? import ./nix/sources.nix
  , optimize ? false
  , haddocks ? false
  , failOnWarnings ? false # FIXME
  , ...
  }:
(import ./release.nix args).crypto-pubkey-openssh
