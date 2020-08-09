# Log Parser

The Log Parser takes a log file as input and returns a list of webpages, ordered by page views, and a list of webpages, ordered by unique views.

## Setup

Clone the repository and run the following command to install all the dependencies:

```bash
$ bundle install  
```

You may need to change the permissions on `parser.rb` as follows:
```bash
chmod +x parser.rb
```

## Testing

To run RSpec (with coverage) followed by Rubocop run script:  

```bash
$ ./scripts/tdd.test
```

## Feature Test

As the exact output of the supplied `webserver.log` file is not known, the feature test runs using a smaller known set of data provided in `./data/feature_test.log`.

(All input data is stored in the `./data` directory.)

The [feature test](./spec/features/parser_spec.rb) can be run using:
```bash
rspec spec/features/parser_spec.rb
```
Based on the [test data](./data/feature_test.log):

```bash
/about 061.945.150.735
/about/2 184.123.665.067
/about/2 184.123.665.067
/about/2 444.701.448.104
/about/2 444.701.448.104
/about/2 444.701.448.104
/contact 184.123.665.067
/contact 316.433.849.805
/contact 444.701.448.104
/contact 543.910.244.929
/contact 555.576.836.194
/home 184.123.665.067
/home 184.123.665.067
/home 316.433.849.805
/home 336.284.013.698
/home 336.284.013.698
/home 444.701.448.104
/home 444.701.448.104
/home 543.910.244.929
/home 555.576.836.194
```

 The feature test expects the following output:

```bash
./parser.rb ./data/feature_test.log
/home 9 visits
/about/2 5 visits
/contact 5 visits
/about 1 visit

/home 6 unique views
/contact 5 unique views
/about/2 2 unique views
/about 1 unique view
```

## Assumptions

- The script prints visits followed by unique views
- Sub-directories are considered separate entires
- If two entries have the same count, they're listed in alphabetical order  
- IP addresses have leading zeros

## Improvements

- Validate log entries are correct
- Provide option to specify path depth to be counted
- Allow for IP addresses without leading zeros
- Allow user to specify visist or unique views
- Allow multiple log files as input
