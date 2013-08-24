#encoding: UTF-8
require 'spec_helper'

describe Termislator::SpeechSynthesizer do
  describe "call" do
    before do
      response = double 'fake_response', body: :binary_sound_file
      fetcher = double 'fake_fetcher', data: response
      handler = double 'fake_sound_handler', call: :nothing
      Termislator::DataFetcher.stub(:new) { fetcher }
      Termislator::SoundResponseHandler.stub(:new) { handler }
    end

    it "executes correct service objects" do
      Termislator::SoundResponseHandler.should_receive(:new).with(:binary_sound_file)
      Termislator::SpeechSynthesizer.new(target_lang: :en, text: 'your mother', voice: true).call
    end
  end
end