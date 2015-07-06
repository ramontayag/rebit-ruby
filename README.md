[![Build Status](https://travis-ci.org/ramontayag/rebit-ruby.svg)](https://travis-ci.org/ramontayag/rebit-ruby)

# Rebit

Ruby wrapper for the Rebit.ph API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rebit'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rebit

## Usage

All interaction is done via a client object:

```ruby
client = Rebit.new
```

### Rates

```ruby
client.rates
#=> {"USDPHP" => 45.0325, "USD" => 254.51, ...}
```

### Vendor

To make any vendor calls, you must set the vendor credentials (typically done in an initializer):

```ruby
# This instantiates a vendor object which you can use later on. Useful if you don't want to make an extra GET request
vendor = Rebit::Vendor.new(vendor_api_token: "MY_VENDOR_API_KEY")

# This finds a vendor (GET request to the server), which you can use later on
vendor = client.vendors.find("MY_VENDOR_API_KEY")
```

Both `vendor` objects behave the same way if you will simply use them for its resources:

### Vendor Users

```ruby
vendor.users.all
#=> VendorUser objects

vendor.users.find(32)
#=> User with ID 32.

jake = vendor.users.create(
  first_name: "Jake",
  last_name: "Chambers",
  email: "jake@ka.tet",
)
jake.first_name #=> "Jake"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ramontayag/rebit. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

