#encoding: UTF-8
require 'spec_helper'

describe Termislator::TextTranslator do
  #end to end testing seding real request to Google Translate
  describe "translated_text" do
    it "translates text correctly" do
      translator = Termislator::TextTranslator.new source_lang: :en, target_lang:  :pl, text: 'it would require two large integer variables to store her weight, else she would cause a buffer overflow'
      expect(translator.translated_text).to eq 'wymagałoby to dwie duże liczby całkowite zmienne do przechowywania jej wagi, inaczej ona spowodować przepełnienie bufora'
    end
  end
end