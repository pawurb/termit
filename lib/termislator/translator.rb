require_relative 'user_input_parser'
require_relative 'url_formatter'
require_relative 'data_fetcher'
require_relative 'text_response_handler'
require_relative 'sound_response_handler'
require_relative 'handler_factory'

module Termislator
  class Translator
    def initialize options
      @options = options
      @url = Termislator::UrlConstructor.new(options).url
    end

    def translate
      p @options
      response = Termislator::DataFetcher.new(@url, @options[:text]).data
      handler = Termislator::HandlerFactory.new(voice: @options[:voice], response_body: response.body ).handler
      handler.display
    end
  end
end