# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'anego/version'

Gem::Specification.new do |spec|
  spec.name          = "anego"
  spec.version       = Anego::VERSION
  spec.authors       = ["fakestarbaby"]
  spec.email         = ["fakestarbaby@gmail.com"]
  spec.summary       = %q{Ruby wrapper for the App Annie API}
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/fakestarbaby/anego"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rest-client"
  spec.add_dependency "hashie"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
end
