module Mustache where

import Data.StrMap
import Prelude

type Template = String

type Tag = String

foreign import name :: String

foreign import version :: String

foreign import tags :: Array String

foreign import parse :: Template -> Array Tag -> Array (Array String)

foreign import render :: Template -> StrMap String -> StrMap String

foreign import escape :: String -> String
