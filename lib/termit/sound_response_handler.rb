#encoding: UTF-8
require 'fileutils'

module Termit
  class SoundResponseHandler
    def initialize data
      @data = data
    end

    def call
      location = "#{File.expand_path('~')}/.termit"
      create_target_dir location
      File.open("#{location}/sound_response.mp3", "wb") do |file|
        file.write(@data)
      end
      system "mpg123 -q #{location}/sound_response.mp3"
    end

    private

    def create_target_dir location
      ::FileUtils.mkdir_p location unless File.directory?(location)
    end
  end
end
