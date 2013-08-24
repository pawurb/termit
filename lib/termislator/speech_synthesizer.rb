module Termislator
  class SpeechSynthesizer
    def initialize options
      @text = options[:text]
      @url = Termislator::UrlConstructor.new(options).url
    end

    def call
      response = Termislator::DataFetcher.new(@url, @text).data
      Termislator::SoundResponseHandler.new(response.body).call
    end
  end
end