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
      "#{host}/?tl=#{@options[:target_lang]}&sl=#{@options[:source_lang]}&ie=UTF-8&oe=UTF-8"
    end

    def construct_voice_url
      "#{host}/translate_tts?tl=#{@options[:target_lang]}&ie=UTF-8&oe=UTF-8"
    end

    def host
      "http://translate.google.com"
    end
  end
end