# SharenowCli

sharenow-cli is a gem that provides cli that can upload files from the command line to the file upload service [share-now](https://www.share-now.me)

## Installation

    $ gem install sharenow_cli

## Usage

basic usage

Please specify the file path you want to register as the first argument.


```
$ sharenow push './sample.rb' -t 'title' -d 'description' -l 3
```

options

|option|alias|about|default|
|:---|:---|:---|:---|
|--title|-t|set title|""|
|--desc|-d|set description|""|
|--delete_limit|-l|set file and content delte limit|14|


Multiple files can be specified

```
$ sharenow push './foo.rb ./bar.rb' -t 'title' -d 'description' -l 3
$ sharenow push './.*rb' -t 'title' -d 'description' -l 3
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/sharenow_cli.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
