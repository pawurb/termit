#encoding: UTF-8
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
        abort(error_message_for_platform)
      end
    end

    def error_message_for_platform 
      message = "Termit speech synthesis requires mpg123 installed."
      case Gem::Platform.local.os
      when "darwin"
        message << "\nPlease run 'brew install mpg123'"
      when "linux"
        message << "\nPlease run 'sudo apt-get install mpg123'"
      end
      message
    end
  end
end