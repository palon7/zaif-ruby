# Etwings

Etwings API wrapper for ruby.

## Installation

Add this line to your application's Gemfile:

    gem 'etwings'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install etwings

## Usage

**rubydocs for repository**: http://www.rubydoc.info/github/palon7/etwings/master/Etwings

```ruby
require 'etwings'

api = Etwings::API.new(:api_key => ETWINGS_KEY, :api_secret => ETWINGS_SECRET)
api.bid("btc", 30760, 0.0001)
api.ask("btc", 30320, 0.0001)

api.get_info
```

## Contributing

1. Fork it ( https://github.com/palon7/etwings/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
