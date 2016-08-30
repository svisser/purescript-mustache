module Test.Main where

import Prelude (bind, Unit)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (log, CONSOLE)
import Data.StrMap as S
import Mustache (render, MustacheEffect)

view :: S.StrMap String
view = S.insert "name" "John" (S.insert "value" "10000" S.empty)

template = "Hello {{name}}! You have just won ${{value}}!"

// This is a poor test. Please add better tests.
main :: forall a. Eff
  ( mustache :: MustacheEffect
  , console :: CONSOLE
  | a
  ) Unit
main = do
  result <- render template view S.empty
  log result
