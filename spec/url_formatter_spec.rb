require 'spec_helper'

describe Termislator::UrlFormatter do
  describe "url method" do
    context "when voice flag is set to false" do
      it "returns correctly formatted url" do
        url_formatter = Termislator::UrlFormatter.new  source_lang: :en, target_lang: :fr, text: 'your mother', voice: false
        url = "http://translate.google.com/?tl=fr&sl=en&ie=UTF-8&oe=UTF-8"
        expect(url_formatter.url).to eq(url)
      end
    end

    context "when voice flag is set to false" do
      it "returns correctly formatted url" do
        url_formatter = Termislator::UrlFormatter.new  source_lang: :en, target_lang: :fr, text: 'your mother', voice: true
        url = "http://translate.google.com/translate_tts?tl=fr&sl=en&ie=UTF-8&oe=UTF-8"
        expect(url_formatter.url).to eq(url)
      end
    end
  end

end