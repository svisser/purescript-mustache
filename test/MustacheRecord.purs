module Test.MustacheRecord where

import Prelude

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (log, CONSOLE)
import MustacheRecord (MUSTACHE, Template, TemplateP, View, ViewP, render, renderP)

type ViewRec =
  ( name :: String
  , value :: String
  , cityName :: String
  , items :: Array { name :: String, price :: Int }
  )

view :: View ViewRec
view =
  { name: "John"
  , value: "10000"
  , cityName: "Citytown"
  , items:
    [ { name: "item1", price: 1 }
    , { name: "item2", price: 2 }
    ]
  }

templateSimple :: Template ( name :: String, value :: Int )
templateSimple = "<div>Hello {{name}}! You have just won ${{value}}!</div>"

templatePartial ::
  TemplateP
    ( name :: String, value :: Int )
    ( cityPartial :: String )
templatePartial = "<div>Hello {{name}} from {{>cityPartial}}! You have just won ${{value}}!</div>"

viewPartial ::
  ViewP
    ViewRec
    ( cityPartial :: String )
viewPartial =
  { view: view
  , partials:
    { cityPartial: "<span>{{cityName}}</span>"
    }
  }

templateComment :: Template ( name :: String )
templateComment = "<div>Hello {{!name}} (commented)!</div>"

templateRepeat ::
  Template
    ( name :: String
    , items :: Array { name :: String, price :: Int }
    )
templateRepeat = "<list>{{#items}}<name>{{name}}</name><price>${{price}}</price>{{/items}}</list>"


-- This is a poor test. Please add assertions and better tests.
main :: forall a. Eff
  ( mustache :: MUSTACHE
  , console :: CONSOLE
  | a
  ) Unit
main = do
  log =<< render templateSimple view
  log =<< renderP templatePartial viewPartial
  log =<< render templateComment view
  log =<< render templateRepeat view
