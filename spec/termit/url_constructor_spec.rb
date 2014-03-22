#encoding: UTF-8
require 'spec_helper'

describe Termit::UrlConstructor do
  describe "url method" do
    context "when talk flag is set to false" do
      it "returns correctly formatted url" do
        url_formatter = Termit::UrlConstructor.new  source_lang: :en, target_lang: :fr, text: 'your mother', talk: false
        url = "http://translate.google.com/translate_a/t?client=t&sl=en&tl=fr&hl=pl&sc=2&ie=UTF-8&oe=UTF-8&prev=enter&ssel=0&tsel=0&"

        expect(url_formatter.url).to eq(url)
      end
    end

    context "when talk flag is set to true" do
      it "returns correctly formatted url" do
        url_formatter = Termit::UrlConstructor.new  target_lang: :fr, text: 'your mother', talk: true
        url = "http://translate.google.com/translate_tts?tl=fr&ie=UTF-8&oe=UTF-8"
        expect(url_formatter.url).to eq(url)
      end
    end
  end
end
