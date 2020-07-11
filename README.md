# Attention: Deprecated

This repository is no longer maintained. The original README is below.

# Cognomen
Cognomen is a global name store in Lua. It is intended to allow you to name things that normally can't be named - userdatas and functions - for debugging purposes.

Cognomen uses a weak table to store names. It will not cause memory leaks, but it can cause some issues with certain types of userdatas - use caution!

## API
Cognomen provides three functions:

### `name`
When called with two arguments, `name` will name an object in Cognomen's global store. `object` may be any non-nil value, but the `name` parameter must be a string:
```lua
local someClass = {}
-- ...

Cognomen.name(someClass, "someClass")
```

This will throw if the object is already named:
```lua
Cognomen.name(someClass, "SomeClass")
--> error: someClass is already named "someClass"
```

When called with one argument, `name` acts as an alias for `getName`:
```lua
print(Cognomen.name(someClass))
--> someClass
```

### `unname`
`unname` removes the name of an object. This function has no effect if the object is already unnamed. `object` must be non-nil.

After calling this function, you may set a new name for the object with `name`.

```lua
Cognomen.unname(someClass)
print(Cognomen.name(someClass))
--> nil
```

### `getName`
`getName` gets the name of an object, or `nil` if the object is unnamed.

```lua
print(Cognomen.getName(someClass))
--> someClass
```
