module Termit
  class UserInputParser
    extend ::Delegation
    @output_manager = Termit::OutputManager.new

    delegate :display_error_info_and_quit, :display_help_and_quit, :display_version_and_quit, to: @output_manager
    def initialize user_input
      @user_input = user_input
      display_help_and_quit if @user_input.index("-h") || @user_input.empty?
      display_version_and_quit if @user_input.index("-v")
      validate_user_input
    end

    def options
      parse_input
    rescue ArgumentError
      display_error_info_and_quit
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
      [0, 1].each do |index|
        raise ArgumentError unless [2, 4].include?(@user_input[index].length)
      end
    end
  end
end