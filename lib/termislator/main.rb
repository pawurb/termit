module Termislator
  class Main
    def initialize options
      @options = options
    end

    def translate
      text_translator = Termislator::TextTranslator.new(@options)
      text_translator.call
      speech_synthesis text_translator.text if @options[:voice]
    end

    private

    def speech_synthesis text
      options = @options.merge(text: text)
      Termislator::SpeechSynthesizer.new(options).call
    end
  end
end