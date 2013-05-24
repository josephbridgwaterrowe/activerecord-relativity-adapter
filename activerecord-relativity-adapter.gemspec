# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'activerecord-relativity-adapter'

Gem::Specification.new do |gem|
  gem.name          = "activerecord-relativity-adapter"
  gem.version       = Activerecord::Relativity::Adapter::VERSION
  gem.authors       = ["Joseph Bridgwater-Rowe"]
  gem.email         = ["joe@westernmilling.com"]
  gem.description   = 'ActiveRecord adapter for Liant Relativity. Only for use with JRuby. Requires separate Relativity JDBC driver.'
  gem.summary       = 'ActiveRecord adapter for Liant Relativity.'
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
