#encoding: UTF-8
require 'spec_helper'

describe Termislator::SpeechSynthesizer do
  describe "call" do
    it "creates and plays the sound file" do
      Termislator::SpeechSynthesizer.new(target_lang: :en, text: 'your mother').call
    end
  end
end