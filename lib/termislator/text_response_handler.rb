module Termislator
  class TextResponseHandler
    def initialize text
      @text = text
    end

    def call
      p parsed_data
    end

    private

    def parsed_data
      translation = @text.scan(/(TRANSLATED_TEXT=')(.*?)(')/).pop[1]
      encoding = 'UTF-8'
      translation.gsub!(/(\\x26#39;)/, "'")
      translation.force_encoding(encoding).encode(encoding)
    end
  end
end