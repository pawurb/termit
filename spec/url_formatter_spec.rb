require 'spec_helper'

describe Termislator::UrlFormatter do
  describe "call method" do
    context "when voice flag is set to false" do
      it "returns correctly formatted url" do
        url_formatter = Termislator::UrlFormatter.new  source_lang: :en, target_lang: :fr, text: 'your mother', voice: false
        url = "http://translate.google.com/?tl=fr&sl=en&ie=UTF-8&oe=UTF-8"
        expect(url_formatter.call).to eq(url)
      end
    end
  end

end