#encoding: UTF-8
module Termit
  class UrlConstructor
    Host = "https://translate.google.com"

    def initialize options
      @options = options
    end

    def url
      @options[:talk] ? construct_sound_url : construct_text_url
    end

    private

    def construct_text_url
      "#{Host}/translate_a/single?client=t&sl=#{@options[:source_lang]}&tl=#{@options[:target_lang]}&hl=pl&dt=bd&dt=ex&dt=ld&dt=md&dt=qca&dt=rw&dt=rm&dt=ss&dt=t&dt=at&ie=UTF-8&oe=UTF-8&otf=2&srcrom=1&ssel=3&tsel=6&kc=2&tk=522578|870062"
    end

    def construct_sound_url
      "#{Host}/translate_tts?ie=UTF-8&tl=#{@options[:target_lang]}&total=1&idx=0&textlen=5&tk=735012&client=t"
    end
  end
end
