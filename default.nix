{ cabal
, mtl
, transformers
, lens
, xmlLens
, xmlConduit
, conduit
, conduitCombinators
, conduitExtra
, logging
, filepath
, temporary
, text
, time
, hspec
}:

cabal.mkDerivation (self: {
  pname = "bugs";
  version = "0.0.1";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  buildDepends = [
    mtl transformers lens xmlLens xmlConduit conduit conduitCombinators
    conduitExtra logging filepath temporary text time hspec
  ];
  meta = {
    homepage = "https://github.com/jwiegley/bugs";
    description = "Library for working with Bug tracking data";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
