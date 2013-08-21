module Termislator
  class TextResponseHandler
    def initialize response_body
      @text = response_body
    end

    def text
      parse_text
    end

    def parse_text
      translation = @text.scan(/(TRANSLATED_TEXT=')(.*?)(')/).pop[1]
      encoding = 'UTF-8'
      translation.force_encoding(encoding).encode(encoding)
    end
  end
end