module Mustache where

import Control.Monad.Eff (Eff())
import Data.StrMap (StrMap())
import Prelude (Show, Unit())

type Template = String

type Tag = String

type View = StrMap String

type Partials = StrMap String

type Token = Array TokenElement

foreign import data TokenElement :: *

foreign import showTokenElementImpl :: TokenElement -> String

instance showTokenElement :: Show TokenElement where
  show = showTokenElementImpl

foreign import data MustacheEffect :: !

foreign import name :: String

foreign import version :: String

foreign import tags :: Array Tag

foreign import parse :: forall e. Template -> Array Tag -> Eff (mustache :: MustacheEffect | e) (Array Token)

foreign import render :: forall e. Template -> View -> Partials -> Eff (mustache :: MustacheEffect | e) String

foreign import escape :: String -> String

foreign import clearCache :: forall e. Eff (mustache :: MustacheEffect | e) Unit
