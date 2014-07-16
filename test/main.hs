{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}

module Main where

import Control.Exception
import Data.Bugs
import Data.Char
import Data.Text (Text, pack)
import Prelude hiding (log)
import Test.Hspec

tryAny :: IO a -> IO (Either SomeException a)
tryAny = try

main :: IO ()
main = hspec $ do
    describe "" $ do
        it "" $ True `shouldBe` True
