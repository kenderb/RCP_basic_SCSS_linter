require 'strscan'
class ErrorChecker
  attr_reader :string_list
  def initialize(string_list)
    @string_list = string_list
  end

  def mixin_checker
    found_mixin = false
    @string_list.each do |line|
      string = StringScanner.new(line)
      found_mixin = true if string.scan('@mixin')
    end
    found_mixin
  end
end
