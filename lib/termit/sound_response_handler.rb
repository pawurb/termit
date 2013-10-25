#encoding: UTF-8
require 'fileutils'

module Termit
  class SoundResponseHandler
    def initialize data
      @data = data
    end

    def call(os)
	  if os == "Windows"
	    location = ENV['HOMEDRIVE'] + ENV['HOMEPATH'] + "\\.termit"
      else
        location = "#{File.expand_path('~')}/.termit"
      end

      create_target_dir location
      File.open("#{location}/sound_response.mpeg", "wb") do |file|
        file.write(@data)
      end

      if os == "Windows"
	    # Need to find alternative to -Z (random play).  The mpeg was being cut short.
	    system "mpg123 -q -Z #{location}/sound_response.mpeg"
      else
	    system "mpg123 -q #{location}/sound_response.mpeg"
      end
    end

    private

    def create_target_dir location
      ::FileUtils.mkdir_p location unless File.directory?(location)
    end
  end
end



