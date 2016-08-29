module Termit
  module CanOutput
    def self.included(klass)
      klass.send(:extend, ::DelegateIt)
    end

    private

    def output_manager
      @_output ||= Termit::OutputManager.new
    end
  end
end
