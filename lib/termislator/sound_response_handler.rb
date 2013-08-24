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



