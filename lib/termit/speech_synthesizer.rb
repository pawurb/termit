#encoding: UTF-8
module Termit
  class SpeechSynthesizer
    include CanOutput
    delegate :display_player_error_and_quit, to: :output_manager

    def initialize options
      check_sound_player
      @text = options[:text]
      @url = Termit::UrlConstructor.new(options).url
    end

    def call
      response = Termit::SoundFetcher.new(@url, @text).data
      Termit::SoundResponseHandler.new(response.body).call
    end

    private

    def check_sound_player
      unless system 'which mpg123 > /dev/null'
        display_player_error_and_quit
      end
    end
  end
end
