#encoding: UTF-8
require 'spec_helper'

describe Termit::Main do
  describe "translate" do
    before do
      text_translator = double 'fake_text_tranlsator', call: nil, text: :result
      Termit::TextTranslator.stub(:new) { text_translator }
    end

    context "talk flag is set to false" do
      it "executes only the TextTranslator" do
        Termit::TextTranslator.should_receive(:new)
        Termit::SpeechSynthesizer.should_not_receive(:new)
        Termit::Main.new(source_lang: :pl, target_lang: :en, text: 'cześć i czołem').translate
      end
    end

    context "voice flag is set to true" do
      before do
        speech_synthesizer = double 'fake_speech_synthesizer', call: :sound
        Termit::SpeechSynthesizer.stub(:new) { speech_synthesizer }
      end

      it "executes both TextTranslator and SpeechSynthesizer" do
        Termit::TextTranslator.should_receive(:new)
        Termit::SpeechSynthesizer.should_receive(:new)
        Termit::Main.new(source_lang: :pl, target_lang: :en, text: 'cześć i czołem', talk: true).translate
      end
    end
  end
end