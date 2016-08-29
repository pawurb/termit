#encoding: UTF-8
module Termit
  class TextTranslator
    attr_reader :text

    def initialize options
      @options = options.merge(talk: false)
      @url = Termit::UrlConstructor.new(@options).url
    end

    def call
      response = Termit::TextFetcher.new(@url, @options[:text]).data
      @text = Termit::TextResponseHandler.new(response.body).call
    end
  end
end
