$:.push File.expand_path('../lib', __FILE__)

require 'prague/version'

Gem::Specification.new do |gem|
  gem.name        = 'prague'
  gem.version     = Prague::VERSION
  gem.description = 'Rails generator for semi-static pages (like "about us", "disclamer" etc.)'
  gem.summary     = gem.description
  gem.homepage    = 'https://github.com/kostia/prague'
  gem.authors     = ['Kostiantyn Kahanskyi']
  gem.email       = ['kostiantyn.kahanskyi@googlemail.com']
  gem.license = 'MIT'

  gem.files = Dir['{app,config,db,lib}/**/*'] + %w[Rakefile README.md]

  gem.required_ruby_version = '>= 1.9.3'
  gem.add_dependency 'rails', '~> 4.0.4'
end
