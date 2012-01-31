# -*- encoding: utf-8 -*-
require File.expand_path('../lib/aloha-rails/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Lars O. Overskeid", "Gudleik Rasch"]
  gem.email         = ["ovelar@gmail.com", "gudleik@gmail.com"]
  gem.description   = %q{aloha-editor in Rails 3}
  gem.summary       = %q{Provides the aloha-editor for your rails3 app}
  gem.homepage      = "https://github.com/Skalar/aloha-rails"

  gem.files         = `git ls-files`.split("\n")
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "aloha-rails"
  gem.require_paths = ["lib"]
  gem.version       = Aloha::Rails::VERSION

  gem.add_dependency(%q<rails>, ["~> 3.0"])
  gem.add_dependency(%q<jquery-rails>, ["~> 2.0"])

  gem.add_development_dependency %q<rspec-rails>, ["~> 2.8"]
end
