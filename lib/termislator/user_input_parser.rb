module Termislator
  class UserInputParser

    attr_reader :user_input

    def initialize user_input
      raise ArgumentError unless user_input.is_a? Array
      @user_input = user_input
    end

    def options
      parsed = parse_input
      validate_user_input parsed
      parsed
    rescue ArgumentError, NoMethodError
      puts "TERMISLATOR: Wrong data. Example 'termis pl en morowy => pestiferous'"
      exit
    end

    def voice_flag
      flag_index = @user_input.index('-v')
      flag_index ? !!@user_input.delete_at(flag_index) : false
    end

    private

    def parse_input
      parsed = {
       voice: voice_flag,
       source_lang: @user_input.shift.to_sym,
       target_lang: @user_input.shift.to_sym,
       text: @user_input.join(' ')
      }
    end

    def validate_user_input hash
      [:source_lang, :target_lang].each do |key|
        raise ArgumentError unless [2, 4].include?(hash[key].length)
      end
    end
  end
end