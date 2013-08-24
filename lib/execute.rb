require_relative 'termislator'

options = Termislator::UserInputParser.new(ARGV).options
puts Termislator::Main.new(options).translate