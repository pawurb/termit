#encoding: UTF-8
require 'spec_helper'

describe Termit::UrlConstructor do
  describe "url method" do
    context "when talk flag is set to false" do
      it "returns correctly formatted url" do
        url_formatter = Termit::UrlConstructor.new  source_lang: :en, target_lang: :fr, text: 'your mother', talk: false
        url = "https://translate.google.com/translate_a/single?client=t&sl=en&tl=fr&hl=pl&dt=bd&dt=ex&dt=ld&dt=md&dt=qca&dt=rw&dt=rm&dt=ss&dt=t&dt=at&ie=UTF-8&oe=UTF-8&otf=2&srcrom=1&ssel=3&tsel=6&kc=2&tk=522578"

        expect(url_formatter.url).to eq(url)
      end
    end

    context "when talk flag is set to true" do
      it "returns correctly formatted url" do
        url_formatter = Termit::UrlConstructor.new  target_lang: :fr, text: 'your mother', talk: true
        url = "https://translate.google.com/translate_tts?ie=UTF-8&tl=fr&total=1&idx=0&textlen=5&tk=735012&client=t"
        expect(url_formatter.url).to eq(url)
      end
    end
  end
end
