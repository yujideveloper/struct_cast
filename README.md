# StructCast

[![Gem Version](https://badge.fury.io/rb/struct_cast.svg)](https://badge.fury.io/rb/struct_cast)
[![Build](https://github.com/yujideveloper/struct_cast/workflows/Build/badge.svg)](https://github.com/yujideveloper/struct_cast/actions?query=workflow%3ABuild)
[![Maintainability](https://api.codeclimate.com/v1/badges/71ddeac3ead5a224e9ed/maintainability)](https://codeclimate.com/github/yujideveloper/struct_cast/maintainability)

StructCast provides the refinement module that defines the method for casting to a Struct object.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'struct_cast'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install struct_cast

## Usage

``` ruby
using StructCast

Struct({ id: 1, name: "foo" }) #=> #<struct id=1, name="foo">
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/yujideveloper/struct_cast.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
