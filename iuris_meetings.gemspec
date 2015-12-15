$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "iuris/meetings/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "iuris_meetings"
  s.version     = Iuris::Meetings::VERSION
  s.authors     = ["pittuxx"]
  s.email       = ["pittuxx@gmail.com"]
  s.homepage    = "https://github.com/pittuxx"
  s.summary     = "Meetings feature for IurisCRM"
  s.description = "Calendar for IurisCRM"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib,vendor}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.4"
  s.add_dependency "iuris_core"
  s.add_dependency "deface"

  s.add_development_dependency 'sqlite3'
end
