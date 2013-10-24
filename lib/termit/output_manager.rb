#encoding: UTF-8
class Termit::OutputManager
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

Check docs at: github.com/pawurb/termit
EOS
  end

  def display_version
    puts "Termit #{Termit::VERSION}"
  end

  def display_translation_flow from, to
    puts "Translation from #{from.upcase} to #{to.upcase}:"
  end

  def display_synonyms synonyms
    puts ''
    puts 'Synonyms:', synonyms
  end
end