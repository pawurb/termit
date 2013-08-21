require_relative 'user_input_parser'
require_relative 'url_formatter'
require_relative 'data_fetcher'
require_relative 'text_handler'
require_relative 'voice_handler'

module Termislator
  class Translator
    def initialize user_input
      options = Termislator::UserInputParser.new(user_input).options
      @url = Termislator::UrlFormatter.new(options).url
      @text = options[:text]
    end

    def translate
      response = Termislator::DataFetcher.new(@url, @text).data
      Termislator::TextHandler.new(response.body).text
    end
  end
end