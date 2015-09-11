#encoding: UTF-8
module Termit
  class UserInputParser
    include CanOutput

    delegate :display_error_info_and_quit, :display_help_and_quit, :display_version_and_quit, to: :output_manager

    def initialize user_input
      @user_input = user_input
      quit_if_required
      validate_user_input
    rescue ArgumentError
      display_error_info_and_quit
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
       text: @user_input.join(' ').tr('.', ',')
      }
    end

    def extract_flag(symbol)
      flag_index = @user_input.index("-#{symbol}")
      flag_index ? !!@user_input.delete_at(flag_index) : false
    end

    def validate_user_input
      raise ArgumentError unless @user_input.is_a? Array
      @user_input.first(2).each do |language_code|
        raise ArgumentError unless [2, 4].include? language_code.length
      end
    end

    def quit_if_required
      display_help_and_quit if @user_input.index("-h") || @user_input.empty?
      display_version_and_quit if @user_input.index("-v")
    end
  end
end
