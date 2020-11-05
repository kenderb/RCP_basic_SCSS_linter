#!/usr/bin/env ruby
# frozen_string_literal: true

require 'colorize'
require_relative '../lib/file_reader'
require_relative '../lib/error_checker'

module HelperMethods
  ERROR_LIST = { one: "#{'-'.blue} #{'Mixin'.red} generate duplicated code use" \
                    "#{' placeholders'.green} instead: ",
                 two: "#{'-'.blue} #{'Missed semicolon:'.red}",
                 three: "#{'-'.blue} #{'Unclosed block:'.red}" }.freeze
  def self.display_error(error_lines, error)
    if error_lines.empty? || error_lines.instance_of?(String)
      print '.'.green
    else
      error_lines.each do |item|
        puts "#{ERROR_LIST[error]} line #{item}"
      end
    end
  end
end
if __FILE__ == $PROGRAM_NAME
  read_file = ReadFile.new(ARGV.first)
  error_checker = ErrorChecker.new(read_file.read_scss_lines)
  list_of_includes = error_checker.check_duplicate_includes
  list_of_bad_ends = error_checker.check_bad_ending_atribute
  list_of_unclosed_block = error_checker.check_closing_brackets
  HelperMethods.display_error(list_of_includes, :one)
  HelperMethods.display_error(list_of_bad_ends, :two)
  HelperMethods.display_error(list_of_unclosed_block, :three)
  puts ''
end
