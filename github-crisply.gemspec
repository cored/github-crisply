# -*- encoding: utf-8 -*-
require File.expand_path('../lib/github/crisply/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Rafael George"]
  gem.email         = ["george.rafael@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "github-crisply"
  gem.require_paths = ["lib"]
  gem.version       = Github::Crisply::VERSION

  gem.add_dependency 'faraday'
  gem.add_dependency 'faraday_middleware'
  gem.add_dependency 'multi_xml'
  gem.add_dependency 'hashie'
  gem.add_dependency 'nokogiri'
  gem.add_dependency 'sinatra'
  gem.add_dependency 'json'

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'heroku'
  gem.add_development_dependency 'fakeweb'
  gem.add_development_dependency 'rack-test'
end
