module Termit
  class UserInputParser
    def initialize user_input
      @user_input = user_input
      show_help_and_quit if @user_input.index("-h") || @user_input.empty?
      show_version_and_quit if @user_input.index("-v")
      validate_user_input
    end

    def options
      parse_input
    rescue ArgumentError
      puts "TERMIT: Wrong data. Example: 'termit en es the cowboy ' => 'el vaquero"
      exit
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

    def show_help_and_quit
      puts    <<-EOS
=========TERMIT=========
USAGE:
termit 'source_language' 'target_language' 'text'

Example:
termit en fr 'hey cowboy where is your horse?'
=> 'hey cow-boy ou est votre cheval?'

Check docs at: github.com/pawurb/termit
EOS
       exit
    end

    def show_version_and_quit
      puts "Termit #{Termit::VERSION}"
      exit
    end
  end
end