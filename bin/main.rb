#!/usr/bin/env ruby
# frozen_string_literal: true

require 'colorize'
require_relative '../lib/file_reader'
require_relative '../lib/error_checker'

module HelperMethods
  ERROR_LIST = { _101: "#{'Mixin'.red} generate duplicated code " \
                    "#{'use placeholders'.green} instead:",
                 _201: 'Missed semicolon:'.red,
                 _301: 'Unclosed block:'.red,
                 _401: "#{'Found CamelCase, snake, lowerCamelCase.'.red} Use #{'Hyphen'.green} instead:" }.freeze
  def self.display_error(error_lines, error)
    if error_lines.empty? || error_lines.instance_of?(String)
      print '.'.green
    else
      error_lines.each do |item|
        puts "#{'-'.blue} #{ERROR_LIST[error]} line #{item}"
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
  camel_case = error_checker.check_snake_on_selector_name
  unless list_of_includes.instance_of?(String)
    puts "Founds #{list_of_includes.length +
                    list_of_bad_ends.length +
                    list_of_unclosed_block.length +
                    camel_case.length} errors".red
  end
  HelperMethods.display_error(list_of_includes, :_101)
  HelperMethods.display_error(list_of_bad_ends, :_201)
  HelperMethods.display_error(list_of_unclosed_block, :_301)
  HelperMethods.display_error(camel_case, :_401)
  puts ''
end
