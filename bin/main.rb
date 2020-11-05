#!/usr/bin/env ruby
# frozen_string_literal: true

require 'colorize'
require_relative '../lib/file_reader'
require_relative '../lib/error_checker'
if __FILE__ == $PROGRAM_NAME
  read_file = ReadFile.new(ARGV.first)
  error_checker = ErrorChecker.new(read_file.read_scss_lines)
  list_of_includes = error_checker.check_duplicate_includes
  if list_of_includes.empty? || list_of_includes.instance_of?(String)
    puts '.'.green
  else
    list_of_includes.each do |item|
      puts "Using #{'mixin'.red} generate duplicated code use" \
      "#{' placeholders'.green} instead:#{" Line #{item}".red}"
    end
  end
end
