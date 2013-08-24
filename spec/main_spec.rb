#encoding: UTF-8
require 'spec_helper'

describe Termislator::Main do
  describe "translate" do
    before do
      text_translator = double 'fake_text_tranlsator', translated_text: :result
      Termislator::TextTranslator.stub(:new) { text_translator }
    end

    context "voice flag is set to false" do
      it "executes only the TextTranslator" do
        STDOUT.should_receive(:puts).with(:result)
        Termislator::SpeechSynthesizer.should_not_receive(:new)
        Termislator::Main.new(sl: :pl, tl: :en, text: 'cześć i czołem').translate
      end
    end

    context "voice flag is set to true" do
      before do
        speech_synthesizer = double 'fake_speech_synthesizer', call: :sound
        Termislator::SpeechSynthesizer.stub(:new) { speech_synthesizer }
      end

      it "executes both TextTranslator and SpeechSynthesizer" do
        Termislator::TextTranslator.should_receive(:new)
        Termislator::SpeechSynthesizer.should_receive(:new)
        Termislator::Main.new(sl: :pl, tl: :en, text: 'cześć i czołem', voice: true).translate
      end
    end
  end
end