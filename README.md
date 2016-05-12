# Swan

Often there are many config files that need to be shared between many projects and keeping them up to date in every project can be annoying.
Usually it is done by hands copypasting them from project to project.
Swan is a tool to help automate this process.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'swan'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install swan

## Usage

Swan provides a command-line interface through `swan` command.

If you don't have swan config in your project yet, then run:

    $ swan --init

It will create a config file, where you can specify files you want to share between projects.

Example config:

```yaml
rubocop:
  url: 'http://example.com/.rubocop.yml'
  filename: '.rubocop.yml'
  dir: '.'
```

which can also be simplified to:

```yaml
.rubocop.yml: 'http://example.com/.rubocop.yml'
```

Root level elements are key names, which can be referenced in command line if needed.

`url` - location of the file to be downloaded. Can be local (relative or absolute) or remote.

`filename` - filename to save file to. If not specified, root name will be used.

`dir` - where to save file. Current directory by default.

### Command line

Gem exposes command:

    $ swan

This command will download and override specified files.

To download only specific files, run command with `--only comma_separated_key_names` option.

To use another config file, add `--config config.yml` or `-c config.yml` option.


## Development

After checking out the repo, run `bin/setup` to install dependencies. You can run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.
To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, 
which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/staskjs/swan. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

