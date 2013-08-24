require 'spec_helper'

describe Termislator::SoundResponseHandler do
  describe "call method" do
    it "should save the sound file" do
      File.should_receive(:open).with("sound_response.mpeg", "wb")
      Termislator::SoundResponseHandler.new(:response).call
    end

    it "should play the file" do
      Termislator::SoundResponseHandler.new(:response).call
    end
  end
end