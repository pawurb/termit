module Termit
  class TextResponseHandler
    def initialize text, synonyms
      @text = decode text
      @extract_synonyms = synonyms
    end

    def call
      translation = extract_translation
      puts translation
      if @extract_synonyms
        puts ''
        puts 'Synonyms:', extract_synonyms
      end
      translation
    end

    private

    def extract_translation
      @text.split("[[")[1].split("\"")[1]
    end

    def extract_synonyms
      synonyms_data = @text.split("[[")[2].split("[")[1]
      length = synonyms_data.length
      if synonyms_data[0] == '4'
        "---"
      else
        synonyms_data[0..(length-3)].delete("\"").gsub(/(,)/, ", ")
      end
    end

    def decode text
      encoding = 'UTF-8'
      text.gsub!(/(\\x26#39;)/, "'")
      text.force_encoding(encoding).encode(encoding)
    end
  end
end