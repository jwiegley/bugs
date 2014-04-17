{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}

module Main where

import Control.Exception
import Data.C2Hsc
import Data.Char
import Data.String.Here
import Data.Text (Text, pack)
import Prelude hiding (log)
import Test.Hspec

tryAny :: IO a -> IO (Either SomeException a)
tryAny = try

main :: IO ()
main = hspec $ do
    describe "" $ do
        describe "" $ True `shouldBe` True
