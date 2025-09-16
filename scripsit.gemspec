$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "scripsit/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "scripsit"
  s.version     = Scripsit::VERSION
  s.authors     = [ "ATNOS" ]
  s.email       = [ "contact@atnos.com" ]
  s.homepage    = "https://github.com/atnos/scripsit"
  s.summary     = "Email and SMS messaging Rails engine with Liquid templating support"
  s.description = "Scripsit is a Ruby gem that provides email and SMS messaging functionality for Rails applications. It's built as a Rails Engine with Liquid templating support for dynamic content generation, featuring content management, message history tracking, and flexible delivery options."
  s.license     = "MIT"
  s.required_ruby_version = ">= 3.2.8"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", '>= 7.0'
  s.add_dependency "liquid"
  s.add_dependency "pg"
  s.add_dependency "rubocop-rails-omakase"
end
