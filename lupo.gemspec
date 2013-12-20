# encoding: utf-8

require File.expand_path('../lib/lupo/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name        = "lupo"
  gem.version     = Lupo::VERSION.dup
  gem.authors     = [ 'Martin Gamsjaeger (snusnu)' ]
  gem.email       = [ 'gamsnjaga@gmail.com' ]
  gem.description = 'Adds an #each method to your objects'
  gem.summary     = 'A module that installs an #each method and includes Enumerable'
  gem.homepage    = 'https://github.com/snusnu/lupo'

  gem.require_paths    = [ 'lib' ]
  gem.files            = `git ls-files`.split("\n")
  gem.test_files       = `git ls-files -- {spec}/*`.split("\n")
  gem.extra_rdoc_files = %w[LICENSE README.md CONTRIBUTING.md]
  gem.license          = 'MIT'

  gem.add_dependency 'concord', '~> 0.1.4'

  gem.add_development_dependency 'bundler', '~> 1.3.5'
end
