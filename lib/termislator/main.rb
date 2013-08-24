require_relative 'sound_response_handler'
require_relative 'text_translator'
require_relative 'speech_synthesizer'
require_relative 'url_constructor'
require_relative 'data_fetcher'
require_relative 'text_response_handler'


module Termislator
  class Main
    def initialize options
      @options = options
    end

    def translate
      text = Termislator::TextTranslator.new(@options).translated_text
      puts text
      Termislator::SpeechSynthesizer.new(@options).call if @options[:voice]
    end
  end
end