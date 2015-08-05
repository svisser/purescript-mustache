module Mustache where

import Data.StrMap
import Prelude

type MustacheTemplate = String

type MustacheTag = String

foreign import name :: String

foreign import version :: String

foreign import tags :: Array String

foreign import parse :: MustacheTemplate -> Array MustacheTag -> Array (Array String)

foreign import render :: MustacheTemplate -> StrMap String -> StrMap String

foreign import escape :: String -> String
