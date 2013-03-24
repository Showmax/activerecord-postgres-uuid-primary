# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

Gem::Specification.new do |s|
  s.name = "activerecord-postgres-uuid-primary"
  s.version = "0.1.0"

  s.platform    = Gem::Platform::RUBY
  s.license     = "MIT"
  s.authors     = ["Antonin Kral"]
  s.email       = "a.kral@bobek/cz"
  s.homepage    = "http://github.com/icflix/activerecord-postgres-uuid-primary"
  s.summary     = "UUID by default"
  s.description = "This gem adds support for the postgres uuid type. It makes all primary keys uuids by default."
  s.required_ruby_version     = ">= 1.8.7"
  s.required_rubygems_version = ">= 1.3.6"

  s.add_dependency "activerecord", ">= 3.1"
  s.add_dependency "rake"
  s.add_development_dependency "bundler"
  s.add_development_dependency "rdoc"
  s.add_development_dependency "rspec", "~> 2.11"

  git_files            = `git ls-files`.split("\n") rescue ''
  s.files              = git_files
  s.test_files         = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables        = []
  s.require_paths      = %w(lib)
end
