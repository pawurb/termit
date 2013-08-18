require_relative 'user_input_parser'
require_relative 'url_formatter'
require_relative 'data_fetcher'
require_relative 'text_handler'
require_relative 'voice_handler'

module Termislator
  class Translator
    def initialize user_input
      options = Termislator::UserInputParser.new(user_input).call
      @url = Termislator::UrlFormatter.new(options).call
      @text = options[:text]
    end

    def call
      response = Termislator::DataFetcher.new(@url, @text).call
      Termislator::TextHandler.new(response.body).call
    end

  end
end