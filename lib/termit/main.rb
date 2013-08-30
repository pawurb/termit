module Termit
  class Main
    def initialize options
      @options = options
    end

    def translate
      text_translator = Termit::TextTranslator.new(@options)
      text_translator.call
      speech_synthesis text_translator.text if @options[:voice]
    end

    private

    def speech_synthesis text
      options = @options.merge(text: text)
      Termit::SpeechSynthesizer.new(options).call
    end
  end
end