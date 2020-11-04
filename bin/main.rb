#!/usr/bin/env ruby
require 'colorize'
require_relative '../lib/file_reader'
require_relative '../lib/error_checker'
if __FILE__ == $PROGRAM_NAME
  read_file = ReadFile.new(ARGV.first)
  puts ' The file content is: ' + " #{read_file.read_scss_lines}".green
end
