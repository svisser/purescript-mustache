module Mustache where

import Data.StrMap
import Prelude

type Template = String

type Tag = String

type View = StrMap String

type Partials = StrMap String

foreign import name :: String

foreign import version :: String

foreign import tags :: Array Tag

foreign import parse :: Template -> Array Tag -> Array (Array String)

foreign import render :: Template -> View -> Partials -> String

foreign import escape :: String -> String
