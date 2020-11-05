require 'strscan'
class ErrorChecker
  attr_reader :string_list
  def initialize(string_list)
    @string_list = string_list
  end

  private

  def mixin_checker
    mixers_list = []
    @string_list.each do |line|
      string = StringScanner.new(line)
      mixers_list.push(line.split(' ')[1].delete('{')) if string.scan('@mixin')
    end
    mixers_list
  end

  def check_parameter_mixin(item)
    item
  end

  public

  def check_duplicate_includes
    duplicated = []
    unless mixin_checker.empty?
      @string_list.each_with_index do |str, i|
        mixin_checker.each do |item|
          check_parameter_mixin(item) if item.match(/\((\w|.){1,}\)/)
          duplicated.push(i + 1) if str.delete(' ').include?("@include#{item};")
        end
      end
    end
    duplicated
  end
end
