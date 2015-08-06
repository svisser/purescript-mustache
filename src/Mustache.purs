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

-- | Effect that represents side effects within mustache.js.
-- |
-- | This is used to indicate writes that take place to mustache.js's cache.
foreign import data MustacheEffect :: !

-- | Name of the mustache.js dependency.
foreign import name :: String

-- | Version string as specified in mustache.js.
foreign import version :: String

-- | Default mustache.js tags (default: array with "{{" and "}}").
foreign import tags :: Array Tag

-- | Precompile a template and store parsed token in mustache.js's cache.
foreign import parse :: forall e. Template -> Array Tag -> Eff (mustache :: MustacheEffect | e) (Array Token)

-- | Render the template with the given view and partial templates.
foreign import render :: forall e. Template -> View -> Partials -> Eff (mustache :: MustacheEffect | e) String

-- | Escape various characters as HTML entities in the given string.
foreign import escape :: String -> String

-- | Clear the internal cache used by mustache.js.
foreign import clearCache :: forall e. Eff (mustache :: MustacheEffect | e) Unit
