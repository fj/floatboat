# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'floatboat/version'

Gem::Specification.new do |spec|
  spec.name          = "floatboat"
  spec.version       = Floatboat::VERSION
  spec.authors       = ["John Feminella"]
  spec.email         = ["jxf+rubygems@jxf.me"]
  spec.summary       = "Floatboat is a tiny Ruby library for interacting with Ruby's IEEE-754 floats."
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
