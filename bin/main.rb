#!/usr/bin/env ruby
require 'colorize'
require_relative '../lib/file_reader'
require_relative '../lib/error_checker'

# module HelperMethods contents global variables and display_error method
module HelperMethods
  ERROR_LIST = { _101: "#{'Mixin'.light_red} generate duplicated code " \
                    "#{'use placeholders'.blue} instead:",
                 _201: 'Missed semicolon:'.light_red,
                 _301: 'Unclosed block:'.light_red,
                 _401: "#{'Found CamelCase, snake, lowerCamelCase.'.light_red}"\
                  "Use #{'Hyphen'.blue} instead:" }.freeze
  def self.display_error(error_lines, error)
    if error_lines.empty? || error_lines.instance_of?(String)
      puts '- Clean'.green
    else
      error_lines.each do |item|
        warn "#{'- ERROR:'.red} #{ERROR_LIST[error]} line #{item}"
      end
    end
  end
end
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
