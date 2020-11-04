require 'strscan'
class ErrorChecker
  attr_reader :string_list
  def initialize(string_list)
    @string_list = string_list
  end

  def mixin_checker
    @string_list.each do |line|
      string = StringScanner.new(line)
      return true if string.scan('@mixin')
    end
    false
  end
end
