module Mustache where

import Control.Monad.Eff (Eff())
import Data.StrMap
import Prelude

type Template = String

type Tag = String

type View = StrMap String

type Partials = StrMap String

foreign import data MustacheEffect :: !

foreign import name :: String

foreign import version :: String

foreign import tags :: Array Tag

foreign import parse :: Template -> Array Tag -> Array (Array String)

foreign import render :: Template -> View -> Partials -> String

foreign import escape :: String -> String

foreign import clearCache :: forall e. Eff (mustache :: MustacheEffect | e) Unit
