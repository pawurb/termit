module Termislator
  class SpeechSynthesizer
    def initialize options
      check_sound_player
      @text = options[:text]
      @url = Termislator::UrlConstructor.new(options).url
    end

    def call
      response = Termislator::DataFetcher.new(@url, @text).data
      Termislator::SoundResponseHandler.new(response.body).call
    end

    private

    def check_sound_player
      unless system 'which mpg123 > /dev/null'
        raise "Termislator needs mpg123 installed"
      end
    end
  end
end