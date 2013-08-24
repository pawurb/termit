require_relative 'sound_response_handler'
require_relative 'text_translator'
require_relative 'speech_synthesizer'
require_relative 'url_constructor'
require_relative 'data_fetcher'
require_relative 'text_response_handler'


module Termislator
  class Main
    def initialize options
      check_sound_player
      @options = options
    end

    def translate
      text = Termislator::TextTranslator.new(@options).translated_text
      print_result text
      speech_synthesis text if @options[:voice]
    end

    private

    def speech_synthesis text
      options = @options.merge(text: text)
      Termislator::SpeechSynthesizer.new(options).call
    end

    def check_sound_player
      unless system 'which mpg123 > /dev/null'
        raise "Termislator needs mpg123 installed"
      end
    end

    def print_result text
      puts "Translation from #{@options[:source_lang].upcase} to #{@options[:target_lang].upcase}: '#{@options[:text]}' -> '#{text}'"
    end
  end
end