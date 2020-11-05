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
    return 'the file is empty' if @string_list == 'the file is empty'

    @string_list.each_with_index do |str, i|
      unless str.delete(' ').include?('{') || str.delete(' ').include?('}') ||
             str =~ /\A\s*\Z/
        error_lines.push(i + 1) unless str.include?(';')
      end
    end
    error_lines
  end

  private

  def check_brackets_lines
    bracket_lines = {}
    @string_list.each_with_index do |str, i|
      bracket_lines[i + 1] = str[-1] if str.include?('}') || str.include?('{')
    end
    bracket_lines
  end

  public

  def check_closing_brackets
    return 'the file is empty' if @string_list == 'the file is empty'

    lines = check_brackets_lines
    bracket_error_line = []
    lines.each_with_index do |(key, value), i|
      unless lines.values.count('{') == lines.values.count('}')
        bracket_error_line.push(key) if value == lines.values[i + 1]
      end
    end
    if lines.values[-1] == lines.values[0]
      bracket_error_line.push(lines.keys[-1])
    end
    bracket_error_line
  end

  def check_snake_on_selector_name
    lines = []
    camel_case_m = /(^[a-z]|[A-Z0-9])[a-z]*/
    @string_list.each_with_index do |str, i|
      if str.include?('{') || str.include?('}')
        lines.push(i + 1) if str.include?('_') || str.scan(camel_case_m).any?
      end
    end
    lines
  end
end
