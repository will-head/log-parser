#!/usr/bin/env ruby

require_relative "lib/log_parser"

begin
  parser = LogParser.new
  puts parser.summary(ARGV[0])
rescue StandardError => e
  abort(e.to_s)
end
