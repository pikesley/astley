# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'astley/version'

Gem::Specification.new do |spec|
  spec.name          = 'astley'
  spec.version       = Astley::VERSION
  spec.authors       = ['Sam Pikesley']
  spec.email         = ['sam.pikesley@gmail.com']

  spec.summary       = %q{Tweet when somebody clicks a bit.ly link}
  spec.description   = %q{How has my life come to this?}
  spec.homepage      = 'http://pikesley.org'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'httparty', '~> 0.16'
  spec.add_dependency 'dotenv', '~> 2.2'

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'guard-rspec', '~> 4.7'
  spec.add_development_dependency 'timecop', '~> 0.9'
  spec.add_development_dependency 'vcr', '~> 4.0'
  spec.add_development_dependency 'coveralls', '~> 0.8'
end
