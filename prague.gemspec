$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "prague/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "prague"
  s.version     = Prague::VERSION
  s.authors     = ["Kostiantyn Kahanskyi"]
  s.email       = ["kostiantyn.kahanskyi@googlemail.com"]
  s.homepage    = "https://github.com/kostia/prague"
  s.summary     = 'Rails generator for semi-static pages (like "about us", "disclamer" etc.)'
  s.description = 'Rails generator for semi-static pages (like "about us", "disclamer" etc.)'

  s.files = Dir["{app,config,db,lib}/**/*"] + ["Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.8"

  s.add_development_dependency "sqlite3"
end
