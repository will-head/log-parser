#!/usr/bin/env ruby

require_relative "lib/log_parser"

parser = LogParser.new
puts parser.print_summary(ARGV[0])
