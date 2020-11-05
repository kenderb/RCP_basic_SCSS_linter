# frozen_string_literal: true

require 'colorize'

# ReadFile class take a path as a parameter and reads the content
class ReadFile
  attr_reader :file_path

  def initialize(file_path)
    @empty = /\A\s*\Z/
    @file_path = file_path =~ @empty || file_path.nil? ? 'no path' : file_path
  end

  def read_scss_lines
    lines = []
    empty_lines = 0
    File.open(@file_path, 'r') { |file| lines = file.readlines.map(&:chomp) }
    lines.each { |item| item =~ @empty ? empty_lines += 1 : item }
    if lines.length.zero? || empty_lines == lines.length
      'the file is empty'
    else
      lines
    end
  end
end
