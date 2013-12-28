# AnomalyDetect

This gem detects outliers using the SDAR algorithm.

It uses [NMatrix](https://github.com/SciRuby/nmatrix), so it can be calculated at high speed.

Benchmark results:

[catatsuy/ruby_matrix_bench](https://github.com/catatsuy/ruby_matrix_bench)


## Installation

This gem use `NMatrix`.

[Installation · SciRuby/nmatrix Wiki](https://github.com/SciRuby/nmatrix/wiki/Installation)

In advance, you will install the dependent packages.
You might have to pass the environment variables depending on your environment.

Add this line to your application's Gemfile:

    gem 'anomaly_detect'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install anomaly_detect

## Usage

```ruby:main.rb
require "anomaly_detect"

target = "target"
anomaly_detect_instance = AnomalyDetect.new(target: target)

val = 1
anomaly_detect_instance.emit val
score = anomaly_detect_instance.flush
p score
```

Let's put more and more values in chronological order.


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


## LICENSE

[muddydixon/fluent-plugin-anomalydetect](https://github.com/muddydixon/fluent-plugin-anomalydetect)

Copyright 2013 Muddy Dixon

Apache License.

Copyright 2013 KANEKO Tatsuya

This source code is released under the MIT License, see LICENSE.
I remove the function of fluentd plugin.
