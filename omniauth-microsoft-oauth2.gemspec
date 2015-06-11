# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth/microsoft_oauth2/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Moty Michaely"]
  gem.email         = ["moty.mi@gmail.com"]
  gem.description   = %q{OmniAuth strategy for Microsoft.}
  gem.summary       = %q{OmniAuth strategy for Microsoft.}
  gem.homepage      = "https://github.com/motymichaely/omniauth-microsoft-oauth2"
  gem.license       = "MIT"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.name          = "omniauth-microsoft-oauth2"
  gem.require_paths = ["lib"]
  gem.version       = OmniAuth::MicrosoftOauth2::VERSION

  gem.add_dependency 'omniauth', '~> 1.2'
  gem.add_dependency 'omniauth-oauth2', '~> 1.2'
  gem.add_runtime_dependency 'multi_json', '~> 1.3'
  gem.add_development_dependency "rspec", "~> 2.7"
  gem.add_development_dependency 'rack-test'
  gem.add_development_dependency 'webmock'
end
