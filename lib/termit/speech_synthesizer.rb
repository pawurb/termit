module Termit
  class SpeechSynthesizer
    def initialize options
      check_sound_player
      @text = options[:text]
      @url = Termit::UrlConstructor.new(options).url
    end

    def call
      response = Termit::DataFetcher.new(@url, @text).data
      Termit::SoundResponseHandler.new(response.body).call
    end

    private

    def check_sound_player
      unless system 'which mpg123 > /dev/null'
        raise "Termit speech synthesis requires mpg123 installed"
      end
    end
  end
end