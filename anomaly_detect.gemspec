# -*- encoding: utf-8 -*-
require File.expand_path('../lib/anomaly_detect/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["catatsuy"]
  gem.email         = ["catatsuy@pixiv.com"]
  gem.description   = %q{anomaly_detect}
  gem.summary       = %q{anomaly_detect}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "anomaly_detect"
  gem.require_paths = ["lib"]
  gem.version       = AnomalyDetect::VERSION

  gem.add_runtime_dependency "json"
  gem.add_runtime_dependency "nmatrix"
end
