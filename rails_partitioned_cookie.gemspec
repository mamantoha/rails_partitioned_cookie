lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "rails_partitioned_cookie/version"

Gem::Specification.new do |spec|
  spec.name          = "rails_partitioned_cookie"
  spec.version       = RailsPartitionedCookie::VERSION
  spec.authors       = ["Anton Maminov"]
  spec.email         = ["anton.maminov@gmail.com"]

  spec.summary       = %q{This gem allows you to set the Partitioned cookie directive.}
  spec.homepage      = "https://github.com/mamantoha/rails_partitioned_cookie"
  spec.license       = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/mamantoha/rails_partitioned_cookie"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"

  spec.add_dependency "rack"
end
