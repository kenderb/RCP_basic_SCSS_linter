require 'strscan'
class ErrorChecker
  attr_reader :string_list
  def initialize(string_list)
    @string_list = string_list
  end

  def mixin_checker
    mixers_list =[]
    @string_list.each do |line|
      string = StringScanner.new(line)
      mixers_list.push(line.split(' ')[1]) if string.scan('@mixin')
    end
    mixers_list
  end

  def check_duplicate_includes
    duplicated = []
    unless mixin_checker.empty?
      @string_list.each_with_index do |line, index|
        mixin_checker.each do |item|
          duplicated.push(index + 1) if line.include?(" @include #{item};")
        end
      end
    end
    duplicated
  end
end
