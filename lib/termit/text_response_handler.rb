#encoding: UTF-8
require 'json'

module Termit
  class TextResponseHandler
    include CanOutput
    delegate :display_translation, to: :output_manager

    def initialize text
      @text = decode text
    end

    def call
      translation = extract_translation
      display_translation translation
      translation
    end

    private

    def extract_translation
      JSON.parse(@text)["items"][0]["text"]
    end

    def decode text
      encoding = 'UTF-8'
      text.gsub!(/(\\x26#39;)/, "'")
      text.force_encoding(encoding).encode(encoding)
    end
  end
end
