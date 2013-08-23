module Termislator
  class HandlerFactory

    def initialize args
      @options = args
    end

    def handler
      if @options[:voice]
        Termislator::SoundResponseHandler.new(@options[:data])
      else
        Termislator::TextResponseHandler.new(@options[:data])
      end
    end
  end
end