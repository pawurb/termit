#encoding: UTF-8
require 'spec_helper'

describe Termit::SpeechSynthesizer do
  describe "call" do
    before do
      response = double 'fake_response', body: :binary_sound_file
      fetcher = double 'fake_fetcher', data: response
      handler = double 'fake_sound_handler', call: :nothing
      Termit::SoundFetcher.stub(:new) { fetcher }
      Termit::SoundResponseHandler.stub(:new) { handler }
    end

    context "system has mpg123 installed" do
      it "executes correct service objects" do
        Termit::SpeechSynthesizer.any_instance.stub(:check_sound_player) { nil }
        Termit::SoundResponseHandler.should_receive(:new).with(:binary_sound_file)
        Termit::SpeechSynthesizer.new(target_lang: :en, source_lang: :pl, text: 'your mother', voice: true).call
      end
    end

    context "there is no mpq123 installed" do
      before do
        Object.any_instance.stub(:system) { nil }
      end
      it "executes correct service objects" do
        Termit::OutputManager.any_instance.should_receive(:display_player_error_and_quit)
        Termit::SpeechSynthesizer.new(target_lang: :en, source_lang: :pl, text: 'your mother', voice: true).call
      end
    end
  end
end
