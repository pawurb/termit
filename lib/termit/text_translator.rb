module Termit
  class TextTranslator
    attr_reader :text

    def initialize options
      @options = options.merge(voice: false)
      @url = Termit::UrlConstructor.new(@options).url
    end

    def call
      response = Termit::DataFetcher.new(@url, @options[:text]).data
      print_info
      @text = Termit::TextResponseHandler.new(response.body).call
    end

    def print_info
      puts "Translation from #{@options[:source_lang].upcase} to #{@options[:target_lang].upcase}:"
    end
  end
end