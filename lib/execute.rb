require_relative 'termislator'

options = Termislator::UserInputParser.new(ARGV).options
Termislator::Main.new(options).translate