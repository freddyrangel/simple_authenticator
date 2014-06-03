$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "simple_authenticator/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "simple_authenticator"
  s.version     = SimpleAuthenticator::VERSION
  s.authors     = ["Freddy Rangel"]
  s.email       = ["frederick.rangel@gmail.com"]
  s.summary     = "Simple authentication for rapid development."
  s.description = "A simple authentication system that can be easily modified and extended."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.1.1"
  s.add_dependency "bcrypt"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency "cucumber-rails"
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "poltergeist"
end

