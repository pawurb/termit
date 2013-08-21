#encoding: UTF-8
require 'spec_helper'

describe Termislator::Translator do
  #end to end testing seding real request to Google Translate
  describe "call" do
    it "translates text correctly" do
      translator = Termislator::Translator.new source_lang: :en, target_lang:  :pl, text: 'it would require two large integer variables to store her weight, else she would cause a buffer overflow'
      expect(translator.translate).to eq 'wymagałoby to dwie duże liczby całkowite zmienne do przechowywania jej wagi, inaczej ona spowodować przepełnienie bufora'
    end
  end
end