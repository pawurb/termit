#encoding: UTF-8
module Termit
  class TextTranslator
    attr_reader :text
    extend ::Delegation
    @output_manager = Termit::OutputManager.new
    delegate :display_translation_flow, to: @output_manager

    def initialize options
      @options = options.merge(talk: false)
      @url = Termit::UrlConstructor.new(@options).url
    end

    def call
      response = Termit::DataFetcher.new(@url, @options[:text]).data
      display_translation_flow @options[:source_lang], @options[:target_lang]
      @text = Termit::TextResponseHandler.new(response.body, @options[:synonyms]).call
    end
  end
end