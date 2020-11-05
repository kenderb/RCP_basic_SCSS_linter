# frozen_string_literal: true

require 'strscan'

# class ErrorChecker look for linters errors
class ErrorChecker
  attr_reader :string_list

  def initialize(string_list)
    @string_list = string_list
  end

  def check_duplicate_includes
    duplicated = []
    return 'the file is empty' if @string_list == 'the file is empty'

    @string_list.each_with_index do |str, i|
      duplicated.push(i + 1) if str.delete(' ').include?('@include')
    end
    duplicated
  end

  def check_bad_ending_atribute
    error_lines = []
    @string_list.each_with_index do |str, i|
      unless str.delete(' ').include?('{') || str.delete(' ').include?('}') ||
             str =~ /\A\s*\Z/
        error_lines.push(i + 1) unless str.include?(';')
      end
    end
    error_lines
  end
end
