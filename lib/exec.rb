require_relative 'termislator'

options = Termislator::UserInputParser.new(ARGV).options
puts Termislator::Translator.new(options).translate