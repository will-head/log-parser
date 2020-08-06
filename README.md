# Log Parser

The Log Parser takes a log file as input and returns a list of webpages, ordered by page views, and a list of webpages, ordered by unique views.

## Setup

Clone the repository and run the following command to install all the dependencies:

```bash
$ bundle install  
```

## Testing

To run RSpec (with coverage) followed by Rubocop run script:  

```bash
$ ./scripts/tdd.test
```

To test an individual item run:

```bash
$ ./scripts/tdd.test [item_name]
```

## Feature Test

As the exact output of the supplied `webserver.log` file is not known, the feature test runs using a smaller known set of data provided in `feature_test.log`.

All input data is stored in the `./data` directory.

The [feature test](.spec/features/log_parser_spec.rb) can be run using:
```bash
rspec spec/features/log_parser_spec.rb
```
