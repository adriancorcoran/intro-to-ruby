## How to use Require

### `require`

Use `require` when you want to reference a file present in your load path or from an absolute path.

#### Absolute Path

Requiring through absolute paths is the most barebones way of requiring files in ruby. As the name implies, absolute paths are the same regardless of your current directory.

```ruby
require '/relative/to/root/file'
```

#### Load Path

Requiring via load path is the classic way of requiring files in ruby. This allows ruby to lookup ruby files relative to a folder paths present in the `$LOAD_PATH` global variable. Load path `require`s are used in ruby gems.

```ruby
$LOAD_PATH.unshift(File.dirname(__FILE__)) # add current directory to load path
require 'file' # present at ./file.rb
```

### `require_relative`

Use `require_relative` when you want to reference a file present in the current directory.

#### Why?

While you can do `require './file'`, this doesn't work if you call your script from the wrong directory. So, `require_relative` should be used to properly expand relative paths into absolute ones. `require_relative 'file'` is the same as `require(File.expand_path('file', File.dirname(__FILE__)))`.

```ruby
require_relative 'file' # present at ./file.rb
```
