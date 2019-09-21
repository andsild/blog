{nixpkgs ? import <nixpkgs> { }, compiler ? "ghc865"}:

let
  inherit (nixpkgs) pkgs;
  # at some point in the future I'd like to know how to pass in "enableLibraryProfiling" here
  # you need allowBroken = true for hakyll :(
  #ghc = pkgs.haskell.packages.${compiler}.ghcWithHoogle (ps: with ps; [
  ghc = pkgs.haskell.packages.${compiler}.ghcWithHoogle (ps: with ps; [
        ]);
in
nixpkgs.haskell.lib.buildStackProject {
  name = "default-stack-shell";
  buildInputs = with pkgs; [
    haskellPackages.hlint stack
  ];
  LANG = "en_US.UTF-8";
  inherit ghc;
}
