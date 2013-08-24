#encoding: UTF-8
require 'spec_helper'

describe Termislator::Main do
  describe "call" do
    context "voice flag is set to false" do
      it "executes only the text translator" do
        text_translator = double 'fake_text_tranlsator', translated_text: :result
        Termislator::TextTranslator.stub(:new) { text_translator }
        STDOUT.should_receive(:puts).with(:result)
        Termislator::SpeechSynthesizer.should_not_receive(:new)
        Termislator::Main.new(sl: :pl, tl: :en, text: 'cześć i czołem').translate
      end
    end

    # context "voice flag is set to true" do
    #   it "creates and plays the sound file" do
    #     Termislator::TextTranslator.should_receive(:new)
    #     Termislator::SpeechSynthesizer.should_receive(:new)
    #     Termislator::Main.new(sl: :pl, tl: :en, text: 'cześć i czołem', voice: true).translate
    #   end
    # end
  end
end