module MustacheRecord where

import Control.Monad.Eff (Eff, kind Effect)


foreign import data MUSTACHE :: Effect

foreign import render :: forall i e.
  Template i ->
  View i ->
  Eff (mustache :: MUSTACHE | e) String

foreign import renderP :: forall i1 i2 e.
  TemplateP i1 i2 ->
  ViewP i1 i2 ->
  Eff (mustache :: MUSTACHE | e) String

type Template (i :: # Type) = String
type View i = Record i

type TemplateP (i1 :: # Type) (i2 :: # Type) = String
type ViewP i1 i2 = { view :: Record i1, partials :: Record i2 }
