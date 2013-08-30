#encoding: UTF-8
require 'spec_helper'

describe Termit::SpeechSynthesizer do
  describe "call" do
    before do
      response = double 'fake_response', body: :binary_sound_file
      fetcher = double 'fake_fetcher', data: response
      handler = double 'fake_sound_handler', call: :nothing
      Termit::DataFetcher.stub(:new) { fetcher }
      Termit::SoundResponseHandler.stub(:new) { handler }
    end

    it "executes correct service objects" do
      Termit::SpeechSynthesizer.any_instance.stub(:check_sound_player) { nil }
      Termit::SoundResponseHandler.should_receive(:new).with(:binary_sound_file)
      Termit::SpeechSynthesizer.new(target_lang: :en, text: 'your mother', voice: true).call
    end
  end
end