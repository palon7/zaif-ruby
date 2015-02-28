# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'etwings/version'

Gem::Specification.new do |spec|
  spec.name          = "etwings"
  spec.version       = Etwings::VERSION
  spec.authors       = ["Palon"]
  spec.email         = ["palon7@gmail.com"]
  spec.summary       = %q{Etwings API wrapper.}
  spec.description   = %q{Etwings API wrapper for monacoin/bitcoin trade.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
