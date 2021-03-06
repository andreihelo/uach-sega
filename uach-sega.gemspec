# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'uach/sega/version'

Gem::Specification.new do |spec|
  spec.name          = 'uach-sega'
  spec.version       = Uach::Sega::VERSION
  spec.authors       = ['Andrei Helo']
  spec.email         = ['andreihelo@gmail.com']

  spec.summary       = %q{A Ruby wrapper for the UACH SEGA API.}
  spec.description   = %q{This gem wraps the functionality of the "Sistema Estratégico de Gestión Académica" API of the Universidad Autónoma de Chihuahua.}
  spec.homepage      = 'https://github.com/andreihelo/uach-sega'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'vcr', '~> 2.9'
  spec.add_development_dependency 'webmock', '~> 2.0.1'
end
