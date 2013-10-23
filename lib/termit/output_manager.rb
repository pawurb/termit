#encoding: UTF-8
class Termit::OutputManager
  def display_error_info_and_quit
    puts "TERMIT: Wrong data. Example: 'termit en es the cowboy ' => 'el vaquero"
    exit
  end

  def display_help_and_quit
    puts    <<-EOS
=========TERMIT=========
USAGE:
termit 'source_language' 'target_language' 'text'

Example:
termit en fr 'hey cowboy where is your horse?'
=> 'hey cow-boy ou est votre cheval?'

Check docs at: github.com/pawurb/termit
EOS
    exit
  end

  def display_version_and_quit
    puts "Termit #{Termit::VERSION}"
    exit
  end

  def display_translation_flow from, to
    puts "Translation from #{from.upcase} to #{to.upcase}:"
  end

  def display_synonyms synonyms
    puts ''
    puts 'Synonyms:', synonyms
  end
end