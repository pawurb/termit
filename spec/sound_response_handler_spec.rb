require 'spec_helper'

describe Termislator::SoundResponseHandler do
  describe "call method" do
    it "should save the sound file" do
      file_location = File.dirname(__FILE__)
      File.should_receive(:open)
      Termislator::SoundResponseHandler.new(:response).call
    end

    it "should play the file" do
      Termislator::SoundResponseHandler.new(:response).call
    end
  end
end