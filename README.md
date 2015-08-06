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

view :: L.List (T.Tuple String String)
view = L.Cons (T.Tuple "name" "John") (L.Cons (T.Tuple "value" "10000") L.Nil)

s = "Hello {{name}}! You have just won ${{value}}!"

main = do
  result <- render s (S.fromList view) S.empty
  log result
```
