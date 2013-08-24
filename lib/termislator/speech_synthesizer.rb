module Termislator
  class SpeechSynthesizer
    def initialize options
      p options
      @text = options[:text]
      @url = Termislator::UrlConstructor.new(options).url
    end

    def call
      response = Termislator::DataFetcher.new(@url, @text).data
      p response.body
    end
  end
end