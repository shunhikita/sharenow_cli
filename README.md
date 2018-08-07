# SharenowCli

sharenow-cli is a gem that provides cli that can upload files from the command line to the file upload service [share-now](https://share-now.me)

## Installation

    $ gem install sharenow_cli

## Setup

    $ export SHARENOW_API_TOKEN="YOUR_API_TOKEN"

Register account with [share-now.me](https://share-now.me) and create API token

## Usage

basic usage

Please specify the file path you want to register as the first argument.


```
$ sharenow push './sample.rb' -t 'title' -d 'description' -l 3
```

Multiple files can be specified

```
$ sharenow push './foo.rb ./bar.rb' -t 'title' -d 'description' -l 3
$ sharenow push './.*rb' -t 'title' -d 'description' -l 3
```

options

```
-t, --title           set a title of the file
-d, --desc            set a description of the file
-l, --delete_limit    set deletion deadline up to 90 days. If not set it will not be deleted.
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/sharenow_cli.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
