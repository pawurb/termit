# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'termislator/version'

Gem::Specification.new do |gem|
  gem.name          = "termislator"
  gem.version       = Termislator::VERSION
  gem.authors       = ["pawurb"]
  gem.email         = ["p.urbanek89@gmail.com"]
  gem.summary       = %q{Google Translate in your terminal}
  gem.description   = %q{ Termislator is an easy way to use all the Google Translate goodies straight from your terminal. }
  gem.homepage      = "http://github.com/pawurb/termislator"
  gem.files         = `git ls-files`.split("\n")
  gem.executables   = ['termis']
  gem.test_files    = gem.files.grep(%r{^(spec)/})
  gem.require_paths = ["lib"]
  gem.license       = "MIT"
  gem.add_development_dependency "rspec", '~> 2.14.1'
  gem.add_development_dependency "vcr", '~> 2.5.0'
  gem.add_development_dependency "webmock", '~> 1.12.0'
  gem.add_development_dependency "rake"
end
