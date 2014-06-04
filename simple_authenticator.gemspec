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

  s.add_dependency "bcrypt"
end

