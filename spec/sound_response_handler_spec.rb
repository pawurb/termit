require 'spec_helper'

describe Termislator::SoundResponseHandler do
  pending "VoiceHandler specs waitin"

  describe "display methodd" do
    it "should save play the sound file" do
      Termislator::SoundResponseHandler.new(:dupa).call
    end
  end
end