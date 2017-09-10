module Mustache
  ( Template()
  , Tag()
  , View()
  , Partials()
  , Token()
  , TokenElement()
  , MustacheEffect()
  , name
  , version
  , tags
  , parse
  , render
  , escape
  , clearCache
  ) where

import Data.Show

import Control.Monad.Eff (Eff, kind Effect)
import Data.StrMap (StrMap)
import Prelude (Unit)

type Template = String

type Tag = String

type View = StrMap String

type Partials = StrMap String

type Token = Array TokenElement

foreign import data TokenElement :: Type

foreign import showTokenElementImpl :: TokenElement -> String

instance showTokenElement :: Show TokenElement where
  show = showTokenElementImpl

-- | Effect that represents side effects within mustache.js.
-- |
-- | This is used to indicate interactions with the cache in mustache.js.
foreign import data MustacheEffect :: Effect

-- | Name of the mustache.js dependency (`"mustache.js"`).
foreign import name :: String

-- | Version string as specified in mustache.js.
foreign import version :: String

-- | Default mustache.js tags (default: array with `"{{"` and `"}}"`).
foreign import tags :: Array Tag

-- | Precompile a template and write parsed tokens to a cache within mustache.js.
foreign import parse :: forall e. Template -> Array Tag -> Eff (mustache :: MustacheEffect | e) (Array Token)

-- | Render the template with the given view and partial templates.
foreign import render :: forall e. Template -> View -> Partials -> Eff (mustache :: MustacheEffect | e) String

-- | Escape various characters as HTML entities in the given string.
foreign import escape :: String -> String

-- | Clear the internal cache used by mustache.js.
foreign import clearCache :: forall e. Eff (mustache :: MustacheEffect | e) Unit