# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'itamae/plugin/recipe/oracle_jdk/version'

Gem::Specification.new do |spec|
  spec.name          = "itamae-plugin-recipe-oracle_jdk"
  spec.version       = Itamae::Plugin::Recipe::OracleJdk::VERSION
  spec.authors       = ["Seiei Higa"]
  spec.email         = ["hanachin@gmail.com"]
  spec.summary       = %q{install oracle jdk}
  spec.homepage      = "https://github.com/hanachin/itamae-plugin-recipe-oracle_jdk"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
