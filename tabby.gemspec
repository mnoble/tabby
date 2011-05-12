# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "tabby"
  s.version     = "0.1.0"
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

  # Runtime
  s.add_dependency "thor", "~> 0.14.6"

  # Development
  s.add_development_dependency "rspec",         "~> 2.1.0"
  s.add_development_dependency "fakeout",       ">= 0.0.1"
  s.add_development_dependency "mnoble-fakefs", ">= 0.3.1"
end
