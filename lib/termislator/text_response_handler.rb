module Termislator
  class TextResponseHandler
    def initialize response_body
      @text = response_body
    end

    def display
      p parsed_text
    end

    def parsed_text
      translation = @text.scan(/(TRANSLATED_TEXT=')(.*?)(')/).pop[1]
      encoding = 'UTF-8'
      translation.force_encoding(encoding).encode(encoding)
    end
  end
end