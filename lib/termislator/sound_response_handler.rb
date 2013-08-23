module Termislator
  class SoundResponseHandler
    def initialize data
      @data = data
    end

    def call
      File.open("sound_response.mpeg", "wb") do |file|
        file.write(@data)
      end
    end
  end
end



# http://translate.google.pl/translate_tts?ie=UTF-8&q=whats%20up&tl=en&total=1&idx=0&textlen=8