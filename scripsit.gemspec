$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "scripsit/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "scripsit"
  s.version     = Scripsit::VERSION
  s.authors     = ["Bruno Perles"]
  s.email       = ["bruno@atnos.com"]
  s.homepage    = "https://github.com/atnos/scripsit"
  s.summary     = "Easily send emails and sms."
  s.description = ""
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", '~> 6.0.0'
  s.add_dependency "liquid"
  s.add_dependency "pg"
end
