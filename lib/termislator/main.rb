require_relative 'sound_response_handler'
require_relative 'text_translator'
require_relative 'speech_synthesizer'
require_relative 'url_formatter'
require_relative 'data_fetcher'
require_relative 'text_response_handler'


module Termislator
  class Main
    def initialize options
      @options = options
    end

    def translate
      puts Termislator::TextTranslator.new(@options).translated_text
      Termislator::SpeechSynthesizer.new(@options).call if @options[:voice]
    end
  end
end