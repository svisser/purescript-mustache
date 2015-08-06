## Module Mustache

#### `Template`

``` purescript
type Template = String
```

#### `Tag`

``` purescript
type Tag = String
```

#### `View`

``` purescript
type View = StrMap String
```

#### `Partials`

``` purescript
type Partials = StrMap String
```

#### `Token`

``` purescript
type Token = Array TokenElement
```

#### `TokenElement`

``` purescript
data TokenElement :: *
```

##### Instances
``` purescript
instance showTokenElement :: Show TokenElement
```

#### `showTokenElementImpl`

``` purescript
showTokenElementImpl :: TokenElement -> String
```

#### `MustacheEffect`

``` purescript
data MustacheEffect :: !
```

Effect that represents side effects within mustache.js.

This is used to indicate interactions with the cache in mustache.js.

#### `name`

``` purescript
name :: String
```

Name of the mustache.js dependency (`"mustache.js"`).

#### `version`

``` purescript
version :: String
```

Version string as specified in mustache.js.

#### `tags`

``` purescript
tags :: Array Tag
```

Default mustache.js tags (default: array with `"{{"` and `"}}"`).

#### `parse`

``` purescript
parse :: forall e. Template -> Array Tag -> Eff (mustache :: MustacheEffect | e) (Array Token)
```

Precompile a template and write parsed tokens to a cache within mustache.js.

#### `render`

``` purescript
render :: forall e. Template -> View -> Partials -> Eff (mustache :: MustacheEffect | e) String
```

Render the template with the given view and partial templates.

#### `escape`

``` purescript
escape :: String -> String
```

Escape various characters as HTML entities in the given string.

#### `clearCache`

``` purescript
clearCache :: forall e. Eff (mustache :: MustacheEffect | e) Unit
```

Clear the internal cache used by mustache.js.


