
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "sharenow_cli/version"

Gem::Specification.new do |spec|
  spec.name          = "sharenow_cli"
  spec.version       = SharenowCli::VERSION
  spec.authors       = ['h1kita']

  spec.summary       = 'It provides a command line interface that allows file upload to share-now.me .'
  spec.description   = 'It provides a command line interface that allows file upload to share-now.me .'
  spec.homepage      = "https://github.com/shunhikita/sharenow_cli"
  spec.license       = "MIT"


  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency "thor"
  spec.add_dependency "faraday"
  spec.add_dependency "mime-types"
end
