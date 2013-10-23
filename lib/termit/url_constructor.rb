module Termit
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
      # "#{host}/?tl=#{@options[:target_lang]}&sl=#{@options[:source_lang]}&ie=UTF-8&oe=UTF-8"
      "#{host}/t?client=t&sl=#{@options[:source_lang]}&tl=#{@options[:target_lang]}&hl=pl&sc=2&ie=UTF-8&oe=UTF-8&prev=enter&ssel=0&tsel=0&"
    end

    def construct_voice_url
      "#{host}/translate_tts?tl=#{@options[:target_lang]}&ie=UTF-8&oe=UTF-8"
    end

    def host
      "http://translate.google.com/translate_a"
    end
  end
end
