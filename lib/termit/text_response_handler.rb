#encoding: UTF-8
module Termit
  class TextResponseHandler
    extend ::Delegation
    @output_manager = Termit::OutputManager.new
    delegate :display_synonyms, to: @output_manager

    def initialize text, synonyms_wanted
      @text = decode text
      @synonyms_wanted = synonyms_wanted
    end

    def call
      translation = extract_translation
      puts translation
      display_synonyms extract_synonyms if @synonyms_wanted
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