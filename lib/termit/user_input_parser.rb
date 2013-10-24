#encoding: UTF-8
module Termit
  class UserInputParser
    extend ::Delegation
    @output_manager = Termit::OutputManager.new

    delegate :display_error_info, :display_help, :display_version, to: @output_manager
    def initialize user_input
      @user_input = user_input
      quit_if_required
      validate_user_input
    rescue ArgumentError
      display_error_info
      exit
    end

    def options
      parse_input
    end

    private

    def parse_input
      {
       talk: extract_flag('t'),
       synonyms: extract_flag('s'),
       source_lang: @user_input.shift.to_sym,
       target_lang: @user_input.shift.to_sym,
       text: @user_input.join(' ')
      }
    end

    def extract_flag(symbol)
      flag_index = @user_input.index("-#{symbol}")
      flag_index ? !!@user_input.delete_at(flag_index) : false
    end

    def validate_user_input
      raise ArgumentError unless @user_input.is_a? Array
      raise ArgumentError unless @user_input.length > 1
      [0, 1].each do |index|
        raise ArgumentError unless [2, 4].include?(@user_input[index].length)
      end
    end

    def quit_if_required
      if @user_input.index("-h") || @user_input.empty?
        display_help
        exit
      end
      if @user_input.index("-v")
        display_version
        exit
      end
    end
  end
end