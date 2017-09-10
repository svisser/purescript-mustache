# purescript-mustache
PureScript wrapper for mustache.js

## Installation

    bower install --save purescript-mustache
    npm install mustache
    
## Compiling

If you're use purescript-mustache on the front-end, you will need to compile using `pulp browserify`. Otherwise, compiling with `pulp build` should work.

## Example

Add the following to `Main.purs`:

``` purescript
module Main where

import Prelude (Unit, bind)

import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Console (CONSOLE, log)

import Data.StrMap as S

import Mustache (MustacheEffect, render)

view :: S.StrMap String
view = S.insert "name" "John" (S.insert "value" "10000" S.empty)

s :: String
s = "Hello {{name}}! You have just won ${{value}}!"

main :: forall e. Eff (mustache :: MustacheEffect, console :: CONSOLE | e) Unit
main = do
  result <- render s view S.empty
  log result
```

Run it using:

    pulp run

## Module documentation

- [Mustache](docs/Mustache.md)
