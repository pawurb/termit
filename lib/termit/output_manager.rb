#encoding: UTF-8
module Termit
  class OutputManager
    def display_error_info
      puts "TERMIT: Wrong data. Example: 'termit en es the cowboy ' => 'el vaquero"
    end

    def display_help
      puts    <<-EOS
=========TERMIT=========
USAGE:
termit 'source_language' 'target_language' 'text'

Example:
termit en fr 'hey cowboy where is your horse?'
=> 'hey cow-boy ou est votre cheval?'

Options:
-t - speech synthesis
-s - synonyms list

Check docs at: github.com/pawurb/termit
EOS
    end

    def display_version
      puts "Termit #{Termit::VERSION}"
    end

    def display_translation text
      print "=> "
      puts text
    end

    def display_synonyms synonyms
      print '=> Synonyms: '
      puts synonyms
    end
  end
end