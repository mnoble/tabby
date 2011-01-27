# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "tabby/version"

Gem::Specification.new do |s|
  s.name        = "tabby"
  s.version     = Tabby::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Matte Noble"]
  s.email       = ["me@mattenoble.com"]
  s.homepage    = "http://github.com/mnoble/tabby"
  s.summary     = %q{Simple iTerm2 project environment setup.}
  s.description = %q{Simple iTerm2 project environment setup.}

  s.files            = `git ls-files`.split("\n")
  s.test_files       = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables      = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.extra_rdoc_files = ["README.markdown", "screenshot.png"]
  s.require_paths    = ["lib"]

  s.add_development_dependency "rspec", "~> 2.1.0"
end
