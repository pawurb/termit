module Termislator
  class UrlConstructor
    def initialize request_options
      @request_options = request_options
    end

    def url
      construct_url
    end

    private

    def construct_url
      data = @request_options
      voice_url = data[:voice] ? "translate_tts" : ""
      "http://translate.google.com/#{voice_url}?tl=#{data[:target_lang]}&sl=#{data[:source_lang]}&ie=UTF-8&oe=UTF-8"
    end
  end
end