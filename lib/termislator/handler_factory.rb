module Termislator
  class HandlerFactory

    def initialize args
      @options = args
    end

    def handler
      if @options[:voice]
        Termislator::SoundResponseHandler.new(@options[:response_body])
      else
        Termislator::TextResponseHandler.new(@options[:response_body])
      end
    end
  end
end