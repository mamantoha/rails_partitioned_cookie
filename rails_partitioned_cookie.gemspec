# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_partitioned_cookie/version'

Gem::Specification.new do |spec|
  spec.name          = 'rails_partitioned_cookie'
  spec.version       = RailsPartitionedCookie::VERSION
  spec.authors       = ['Anton Maminov']
  spec.email         = ['anton.maminov@gmail.com']

  spec.summary       = 'This gem allows you to set the Partitioned cookie directive.'
  spec.homepage      = 'https://github.com/mamantoha/rails_partitioned_cookie'
  spec.license       = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 3.1'

  spec.add_development_dependency 'rspec', "~> 3.0"
  spec.add_development_dependency 'rubocop', '~> 1.66', '>= 1.66.1'

  spec.add_dependency 'rack', '~> 2.2', '>=2.2.4'
end
