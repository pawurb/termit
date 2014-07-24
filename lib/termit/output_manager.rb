#encoding: UTF-8
module Termit
  class OutputManager
    def display_error_info_and_quit
      puts "TERMIT: Wrong data. Example: 'termit en es the cowboy' => 'el vaquero'"
      exit
    end

    def display_player_error_and_quit
      message = "TERMIT: speech synthesis requires mpg123 installed."
      case Gem::Platform.local.os
      when "darwin"
        message << "\nPlease run 'brew install mpg123'"
      when "linux"
        message << "\nPlease run 'sudo apt-get install mpg123'"
      end
      abort message
    end

    def display_help_and_quit
      puts    <<-EOS
=========TERMIT=========
Usage:
termit 'source_language' 'target_language' 'text'

Example:
termit en fr 'hey cowboy where is your horse?'
=> 'hey cow-boy ou est votre cheval?'

Options:
-t - speech synthesis
-s - synonyms list

Check docs at: github.com/pawurb/termit
EOS
      exit
    end


    def display_version_and_quit
      puts "Termit #{Termit::VERSION}"
      exit
    end

    def display_translation text
      print "=> "
      puts text
    end

    def display_synonyms synonyms
      print '=> Synonyms: '
      puts synonyms
    end

    def display_no_internet_msg
      puts "TERMIT: There seems to be a problem with your internet connection"
      exit
    end
  end
end