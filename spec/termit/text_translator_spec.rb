#encoding: UTF-8
require 'spec_helper'

describe Termit::TextTranslator do
  describe "translated_text" do
    it "translates text correctly" do
      VCR.use_cassette('bing_1') do
        translator = Termit::TextTranslator.new source_lang: :en, target_lang: :pl, text: 'hey cowboy where is your horse'
        translator.call
        expect(translator.text).to eq 'Hej cowboy gdzie jest Twój koń'
      end
    end
  end

  describe "translated_text" do
    it "translates text correctly" do
      VCR.use_cassette('bing_2') do
        translator = Termit::TextTranslator.new source_lang: :en, target_lang: :pl, text: 'ass'
        translator.call
        expect(translator.text).to eq 'Tyłek'
      end
    end
  end
end
