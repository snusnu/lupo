# lupo

[![Gem Version](https://badge.fury.io/rb/lupo.png)][gem]
[![Build Status](https://secure.travis-ci.org/snusnu/lupo.png?branch=master)][travis]
[![Dependency Status](https://gemnasium.com/snusnu/lupo.png)][gemnasium]
[![Code Climate](https://codeclimate.com/github/snusnu/lupo.png)][codeclimate]
[![Coverage Status](https://coveralls.io/repos/snusnu/lupo/badge.png?branch=master)][coveralls]

[gem]: https://rubygems.org/gems/lupo
[travis]: https://travis-ci.org/snusnu/lupo
[gemnasium]: https://gemnasium.com/snusnu/lupo
[codeclimate]: https://codeclimate.com/github/snusnu/lupo
[coveralls]: https://coveralls.io/r/snusnu/lupo

## Usage

```ruby
require 'lupo'

class TaskList
  include Lupo.enumerable(:tasks)

  def initialize(name, tasks)
    @name, @tasks = name, tasks
  end
end

list = TaskList.new('secret', %w[this and that])

list.each { |t| puts(t) }     # => list
list.each.to_a                # => ['this', 'and', 'that']
list.is_a?(Enumerable)        # => true
list.methods.include?(:tasks) # => false

class ItemList
  include Lupo.collection(:items)
end

list = ItemList.new(%w[this and that])

list.each { |i| puts(i) }               # => list
list.each.to_a                          # => ['this', 'and', 'that']
list.is_a?(Enumerable)                  # => true
list.protected_methods.include?(:items) # => true

other = ItemList.new(%w[this and that])

# see equalizer for detailed docs
list.equal?(other) # => false
list.eql?(other)   # => true
list == other      # => true
```

## Credits

* [snusnu](https://github.com/snusnu)

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for details.

## Copyright

Copyright &copy; 2013 Martin Gamsjaeger (snusnu). See [LICENSE](LICENSE) for details.
