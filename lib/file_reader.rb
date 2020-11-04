require 'colorize'

# ReadFile class take a path as a parameter and reads the content
class ReadFile
  attr_reader :file_path, :reading_error

  def initialize(file_path)
    @file_path = file_path
    @reading_error = reading_error
  end
end
