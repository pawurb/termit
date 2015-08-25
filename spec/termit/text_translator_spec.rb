#encoding: UTF-8
require 'spec_helper'

describe Termit::TextTranslator do
  describe "translated_text" do
    it "translates text correctly" do
      VCR.use_cassette('google_1') do
        translator = Termit::TextTranslator.new source_lang: :en, target_lang: :pl, text: 'hey cowboy where is your horse'
        translator.call
        expect(translator.text).to eq 'hej kowbojem , gdzie jest twój koń'
      end
    end
  end

  describe "translated_text" do
    it "translates text correctly" do
      VCR.use_cassette('google_2') do
        translator = Termit::TextTranslator.new source_lang: :en, target_lang: :pl, text: 'ass', synonyms: true
        translator.call
        expect(translator.text).to eq 'tyłek'
      end
    end
  end
end
