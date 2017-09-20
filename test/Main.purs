module Test.Main where

import Prelude

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE)
import MustacheRecord (MUSTACHE)
import Test.MustacheRecord as MustacheRecord

-- This is a poor test. Please add assertions and better tests.
main :: forall a. Eff
  ( mustache :: MUSTACHE
  , console :: CONSOLE
  | a
  ) Unit
main = do
  MustacheRecord.main
