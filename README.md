# purescript-mustache
PureScript wrapper for mustache.js

## Example

``` purescript
module Main where

import Prelude

import Control.Monad.Eff.Console (log)

import qualified Data.List as L
import qualified Data.StrMap as S
import qualified Data.Tuple as T

import Mustache

item1 = (T.Tuple "name" "John")
item2 = (T.Tuple "value" "10000")

view :: L.List (T.Tuple String String)
view = L.Cons item1 (L.Cons item2 L.Nil)

s = "Hello {{name}}! You have just won ${{value}}!"

main = do
  result <- render s (S.fromList view) S.empty
  log result
```
