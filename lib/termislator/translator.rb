require_relative 'user_input_parser'
require_relative 'url_formatter'
require_relative 'data_fetcher'
require_relative 'text_response_handler'
require_relative 'voice_response_handler'

module Termislator
  class Translator
    def initialize options
      @url = Termislator::UrlFormatter.new(options).url
      @text = options[:text]
    end

    def translate
      response = Termislator::DataFetcher.new(@url, @text).data
      Termislator::TextResponseHandler.new(response.body).text
    end
  end
end