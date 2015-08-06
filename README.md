# purescript-mustache
PureScript wrapper for mustache.js

## Example

``` purescript
module Main where

import Prelude

import Control.Monad.Eff.Console (log)

import qualified Data.StrMap as S

import Mustache

view :: S.StrMap String
view = S.insert "name" "John" (S.insert "value" "10000" S.empty)

s = "Hello {{name}}! You have just won ${{value}}!"

main = do
  result <- render s view S.empty
  log result
```

## Module documentation

- [Mustache](docs/Mustache.md)
