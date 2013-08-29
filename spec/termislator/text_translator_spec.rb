#encoding: UTF-8
require 'spec_helper'

describe Termislator::TextTranslator do
  #end to end testing seding real request to Google Translate !!add VCR!!
  describe "translated_text" do
    it "translates text correctly" do
      VCR.use_cassette('google_translate') do
        translator = Termislator::TextTranslator.new source_lang: :en, target_lang:  :pl, text: 'hey cowboy where is your horse'
        translator.call
        expect(translator.text).to eq 'hey cowboy gdzie jest twój koń'
      end
    end
  end
end