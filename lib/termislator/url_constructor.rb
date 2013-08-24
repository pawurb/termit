module Termislator
  class UrlConstructor
    def initialize options
      @options = options
    end

    def url
      if @options[:voice]
        construct_voice_url
      else
        construct_text_url
      end
    end

    private

    def construct_text_url
      "http://translate.google.com/?tl=#{@options[:target_lang]}&sl=#{@options[:source_lang]}&ie=UTF-8&oe=UTF-8"
    end

    def construct_voice_url
      "http://translate.google.com/translate_tts?tl=#{@options[:target_lang]}&ie=UTF-8&oe=UTF-8"
    end
  end
end