module Termit
  module CanOutput
    def self.included(klass)
      klass.send(:extend, ::DelegateIt)
    end

    def output_manager
      @output ||= Termit::OutputManager.new
    end
  end
end
