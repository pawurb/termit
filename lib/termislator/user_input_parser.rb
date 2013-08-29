module Termislator
  class UserInputParser

    def initialize user_input
      raise ArgumentError unless user_input.is_a? Array
      @user_input = user_input
    end

    def options
      parsed = parse_input
      validate_user_input parsed
      parsed
    rescue Exception
      puts "TERMISLATOR: Wrong data. Example 'termislator pl en morowy => pestiferous'"
      exit
    end

    private

    def parse_input
      parsed = {
       voice: set_voice_flag,
       source_lang: @user_input.shift.to_sym,
       target_lang: @user_input.shift.to_sym,
       text: @user_input.join(' ')
      }
    end

    def set_voice_flag
      flag_index = @user_input.index('-v')
      flag_index ? !!@user_input.delete_at(flag_index) : false
    end

    def validate_user_input hash
      length_error = "must be two letter long string. Try: 'en', 'fr, 'pl' etc."
      raise ArgumentError, "Target language #{length_error}" unless (hash[:source_lang].length == 2)
      raise ArgumentError, "Target language #{length_error}" unless (hash[:target_lang].length == 2)
    end
  end
end