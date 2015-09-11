# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'termit/version'

Gem::Specification.new do |gem|
  gem.name          = "termit"
  gem.version       = Termit::VERSION
  gem.authors       = ["pawurb"]
  gem.email         = ["p.urbanek89@gmail.com"]
  gem.summary       = %q{Google Translate in your terminal}
  gem.description   = %q{ Termit is an easy way to use all the Google Translate goodies straight from your terminal. }
  gem.homepage      = "http://github.com/pawurb/termit"
  gem.files         = `git ls-files`.split("\n")
  gem.executables   = ['termit']
  gem.test_files    = gem.files.grep(%r{^(spec)/})
  gem.require_paths = ["lib"]
  gem.license       = "MIT"
  gem.add_dependency "delegate_it"
  gem.add_dependency "certifi"
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "vcr"
  gem.add_development_dependency "webmock"
  gem.add_development_dependency "rake"
  gem.add_development_dependency "coveralls"
  gem.add_development_dependency "nyan-cat-formatter"
end
