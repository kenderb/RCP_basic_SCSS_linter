#!/usr/bin/env ruby
require 'colorize'
require_relative '../lib/file_reader'
read_file = ReadFile.new(ARGV.first)
puts ' The file content is: ' + " #{read_file.read_scss_lines}".green
