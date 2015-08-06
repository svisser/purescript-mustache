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

foreign import parse :: forall e. Template -> Array Tag -> Eff (mustache :: MustacheEffect | e) (Array (Array String))

foreign import render :: forall e. Template -> View -> Partials -> Eff (mustache :: MustacheEffect | e) String

foreign import escape :: String -> String

foreign import clearCache :: forall e. Eff (mustache :: MustacheEffect | e) Unit
