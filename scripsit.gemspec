$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "scripsit/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "scripsit"
  s.version     = Scripsit::VERSION
  s.authors     = ["Bruno Perles"]
  s.email       = ["bruno@atnos.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Scripsit."
  s.description = "TODO: Description of Scripsit."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.2.0"

  s.add_development_dependency "sqlite3"
end
