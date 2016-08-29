#encoding: UTF-8
require 'spec_helper'

describe Termit::UrlConstructor do
  describe "url method" do
    context "when talk flag is set to false" do
      it "returns correctly formatted url" do
        url_formatter = Termit::UrlConstructor.new  source_lang: :en, target_lang: :fr, text: 'your mother', talk: false
        url = "https://www.bing.com/translator/api/Translate/TranslateArray?from=en&to=fr"

        expect(url_formatter.url).to eq(url)
      end
    end

    context "when talk flag is set to true" do
      it "returns correctly formatted url" do
        url_formatter = Termit::UrlConstructor.new  target_lang: :fr, text: 'your mother', talk: true
        url = "https://www.bing.com/translator/api/language/Speak?locale=fr-FR&gender=male&media=audio/mp3&text=your%20mother"
        expect(url_formatter.url).to eq(url)
      end
    end
  end
end
