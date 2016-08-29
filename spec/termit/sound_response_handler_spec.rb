#encoding: UTF-8
require 'spec_helper'

describe Termit::SoundResponseHandler do
  describe "call method" do
    subject { Termit::SoundResponseHandler.new('tralala') }
    let(:location) { "#{File.expand_path('~')}/.termit" }

    it "saves and plays the sound file the sound file" do
      File.should_receive(:open).with("#{location}/sound_response.mp3", "wb")
      Object.any_instance.should_receive(:system).with("mpg123 -q #{location}/sound_response.mp3")
      subject.call
    end
  end
end
