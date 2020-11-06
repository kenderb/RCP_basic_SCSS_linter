#!/usr/bin/env ruby
require 'colorize'
require_relative '../lib/file_reader'
require_relative '../lib/error_checker'
require_relative '../lib/helper_methods'

# module HelperMethods contents global variables and display_error method

if __FILE__ == $PROGRAM_NAME
  read_file = ReadFile.new(ARGV.first)
  if read_file.read_scss_lines.instance_of?(String)
    puts 'File empty'.red
  else
    error_checker = ErrorChecker.new(read_file.read_scss_lines)
    if error_checker.error_counter.positive?
      puts "Founds #{error_checker.error_counter} errors".red
    else
      puts "Founds #{error_checker.error_counter} errors".green
    end
    HelperMethods.display_error(error_checker.check_duplicate_includes, :_101)
    HelperMethods.display_error(error_checker.check_bad_ending_atribute, :_201)
    HelperMethods.display_error(error_checker.check_closing_brackets, :_301)
    HelperMethods.display_error(error_checker.check_snake_on_selector_name, :_401)
    puts ''
  end
end
