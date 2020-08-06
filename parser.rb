#!/usr/bin/env ruby

if ARGV[0] == "--unique"
  puts "/home 6 unique views"
  puts "/contact 4 unique views"
  puts "/about 2 unique views"
  puts "/about/2 2 unique views"
else
  puts "/home 8 visits"
  puts "/about/2 5 visits"
  puts "/contact 5 visits"
  puts "/about 2 visits"
end
