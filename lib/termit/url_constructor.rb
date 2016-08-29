#encoding: UTF-8

module Termit
  class UrlConstructor
    Host = "https://www.bing.com"

    def initialize options
      @options = options
    end

    def url
      @options[:talk] ? construct_sound_url : construct_text_url
    end

    private

    def construct_text_url
      "#{Host}/translator/api/Translate/TranslateArray?from=#{@options.fetch(:source_lang)}&to=#{@options.fetch(:target_lang)}"
    end

    def construct_sound_url
      "#{Host}/translator/api/language/Speak?locale=#{transform_country_code(@options.fetch(:target_lang))}&gender=male&media=audio/mp3&text=#{URI.encode(@options.fetch(:text))}"
    end

    def transform_country_code(code)
      if code == :en
        'en-US'
      else
        "#{code}-#{code.upcase}"
      end
    end
  end
end
