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
