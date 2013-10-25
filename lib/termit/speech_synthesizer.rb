#encoding: UTF-8
module Termit
  class SpeechSynthesizer
    require 'sys/uname'
    include Sys
    def initialize options
      check_sound_player
      @text = options[:text]
      @url = Termit::UrlConstructor.new(options).url
    end

    def call
      response = Termit::DataFetcher.new(@url, @text).data
      Termit::SoundResponseHandler.new(response.body).call(@os)
    end

    private

    def check_sound_player
	  @os = "Unix"
      @os = "Windows" if Uname.sysname.include? "Windows"

      if @os == "Windows"
        unless system 'where mpg123 > NUL'
          raise "Termit speech synthesis requires mpg123 installed"
        end
      else
        unless system 'which mpg123 > /dev/null'
          raise "Termit speech synthesis requires mpg123 installed"
        end
      end
    end
  end
end