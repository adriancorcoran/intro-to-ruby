## Modules vs Classes

### When to use a Module

Modules can be thought of as static bags of methods and constants. Modules cannot be instantiated but can be mixed into other modules (and classes) with the `include` method.

Use modules to encapsulate shared functionality or static reference points.

```ruby
module GlobalModule
  def self.global_method
  end
end

module SomeBehaviour; end

class Something
  include SomeBehaviour
end
```

### When to use a Class

Classes are similar to modules but use inheritance and instantiation. Classes cannot be mixed into other classes or modules with the `include` method. Ruby's `Class` class is actually a subclass of `Module`. You can define classes and modules by instantiating these classes instead of using the more familiar syntax.

Use classes to instantiate objects and define inheritance chains.

```ruby
class Person
  def initialize(name)
    @name = name
  end
end

class Developer < Person; end

Developer.new('Gannon')
```

### The `::` Operator

`::` is the constant resolution operator. It can be used to access constants from a different scope than your current one. `::` can also be appended to the beginning of a constant to denote it exists at the top (global) level.

```ruby
class SomeClass
  SOME_CONSTANT = 'this is a constant'
end

SomeClass::SOME_CONSTANT

module SomeModule
  class NestedClass; end
  AliasClass = ::SomeClass::NestedModule
end
```
