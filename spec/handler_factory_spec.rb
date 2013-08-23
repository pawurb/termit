require 'spec_helper'

describe Termislator::HandlerFactory do
  describe "handler method" do
    context "when voice flag is set to false" do
      it "return the instance of TextResponseHandler" do
        expect(Termislator::HandlerFactory.new(voice: false, data: :text).handler).to be_kind_of Termislator::TextResponseHandler
      end
    end

    context "when voice flag is set to true" do
      it "return the instance of SoundResponseHandler" do
        expect(Termislator::HandlerFactory.new(voice: true, data: :sound).handler).to be_kind_of Termislator::SoundResponseHandler
      end
    end
  end
end