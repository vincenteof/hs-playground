{ nixpkgs ? import <nixpkgs> {}, compiler ? "default", doBenchmark ? false }:

let

  inherit (nixpkgs) pkgs;

  f = { mkDerivation, base, containers, hspec, lib }:
      mkDerivation {
        pname = "leetcode-hs";
        version = "0.1.0.0";
        src = ./.;
        isLibrary = false;
        isExecutable = true;
        libraryHaskellDepends = [ base containers ];
        executableHaskellDepends = [ base containers ];
        testHaskellDepends = [ base hspec ];
        doHaddock = false;
        license = lib.licenses.mit;
        mainProgram = "leetcode-hs";
      };

  haskellPackages = if compiler == "default"
                       then pkgs.haskellPackages
                       else pkgs.haskell.packages.${compiler};

  variant = if doBenchmark then pkgs.haskell.lib.doBenchmark else pkgs.lib.id;

  drv = variant (haskellPackages.callPackage f {});

in
  pkgs.mkShell {
    buildInputs = with pkgs.haskellPackages; [
      ghc
      cabal-install
      hlint
      drv
    ];
  }
