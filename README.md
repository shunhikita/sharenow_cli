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

Multiple files can be specified

```
$ sharenow push './foo.rb ./bar.rb' -t 'title' -d 'description' -l 3
$ sharenow push './.*rb' -t 'title' -d 'description' -l 3
```

options

```
-t, --title           set title
-d, --desc            set description
-l, --delete_limit    set deletion deadline
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/sharenow_cli.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
