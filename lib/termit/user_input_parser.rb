module Termit
  class UserInputParser
    def initialize user_input
      raise ArgumentError unless user_input.is_a? Array
      display_help_info if user_input.index("-h") || user_input.empty?
      display_version_number if user_input.index("-v")
      @user_input = user_input
    end

    def options
      parsed = parse_input
      validate_langauge_codes parsed
      parsed
    rescue ArgumentError, NoMethodError
      puts "TERMIT: Wrong data. Example: 'termit en es the cowboy ' => 'el vaquero"
      exit
    end


    private

    def parse_input
      parsed = {
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

    def validate_langauge_codes hash
      [:source_lang, :target_lang].each do |key|
        raise ArgumentError unless [2, 4].include?(hash[key].length)
      end
    end

    def display_help_info
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

    def display_version_number
      puts "Termit #{Termit::VERSION}"
      exit
    end
  end
end