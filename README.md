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

class Collection
  include Lupo.new(:entries)

  def initialize(entries)
    @entries = entries
  end
end

Collection.new([1,2,3]).each do |entry|
  puts(entry)
end
```

## Credits

* [snusnu](https://github.com/snusnu)

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for details.

## Copyright

Copyright &copy; 2013 Martin Gamsjaeger (snusnu). See [LICENSE](LICENSE) for details.
