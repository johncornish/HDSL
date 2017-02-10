require 'date'

Gem::Specification.new do |s|
  s.name        = 'hdsl'
  s.version     = '1.0.0'
  s.date        = Date.today.to_s
  s.summary     = "DSL for easy HTML generation."
  s.description = "I got tired of writing HTML by hand at my webmaster job."
  s.authors     = ["John Cornish"]
  s.email       = 'johncornishthe4th@gmail.com'
  s.files       = ["lib/hdsl.rb"]
  s.homepage    =
    'http://rubygems.org/gems/hdsl'
  s.license     = 'GPL-3.0'
end