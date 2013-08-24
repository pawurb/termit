module Termislator
  class TextTranslator
    def initialize options
      @options = options.merge(voice: false)
      @url = Termislator::UrlConstructor.new(@options).url
    end

    def translated_text
      response = Termislator::DataFetcher.new(@url, @options[:text]).data
      Termislator::TextResponseHandler.new(response.body).parsed_text
    end
  end
end