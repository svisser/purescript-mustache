module Test.Main where

import Prelude (bind, Unit, show, ($))
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (log, CONSOLE)
import Data.Eq ((==))
import Data.Ord ((<))
import Data.Semiring ((+))
import Test.QuickCheck (assertEquals)
import Mustache (render, MustacheEffect, Partials(), View())

templateSimple :: String
templateSimple = "<div>Hello {{name}}! You have just won ${{value}}!</div>"

templatePartial :: String
templatePartial = "<div>Hello {{name}} from {{>cityPartial}}! You have just won ${{value}}!</div>"

templateComment :: String
templateComment = "<div>Hello {{!name}} (commented)!</div>"

templateRepeat :: String
templateRepeat = "<list>{{#items}}<name>{{name}}</name><price>${{price}}</price>{{/items}}</list>"

view :: View
  ( name :: String
  , value :: String
  , cityName :: String
  , items :: Array {name :: String, price :: Int}
  )
view =
  { name: "John"
  , value: "10000"
  , cityName: "Citytown"
  , items: [{name: "item1", price: 1}, {name: "item2", price: 2}]
  }

partials :: Partials (cityPartial :: String)
partials =
  { cityPartial: "<span>{{cityName}}</span>"
  }

-- This is a poor test. Please add assertions and better tests.
main :: forall a. Eff
  ( mustache :: MustacheEffect
  , console :: CONSOLE
  | a
  ) Unit
main = do
  resultSimple <- render templateSimple view {}
  --show $ assertEquals resultSimple "<div>Hello John! You have just won $10000!</div>"
  log resultSimple
  resultPartial <- render templatePartial view partials
  log resultPartial
  resultComment <- render templateComment view partials
  log resultComment
  resultRepeat <- render templateRepeat view partials
  log resultRepeat
