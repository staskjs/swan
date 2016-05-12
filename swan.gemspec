# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'swan/version'

Gem::Specification.new do |spec|
  spec.name          = 'swan'
  spec.version       = Swan::VERSION
  spec.authors       = ['Stas Karpov']
  spec.email         = ['gilbert_90@mail.ru']

  spec.summary       = 'Helps automate synchronization of common files between projects'
  spec.homepage      = 'https://github.com/staskjs/swan'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'bin'
  spec.executables   = ['swan']
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
