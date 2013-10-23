require 'spec_helper'

describe Termit::TextResponseHandler do
  describe "call method" do
    context "no synonyms wanted" do
      let(:handler) do
        response_body = File.open('spec/fixtures/text_response').read
        Termit::TextResponseHandler.new(response_body, false)
      end

      it "extracts data from HTTP response body" do
        expect(STDOUT).to receive(:puts).with("Twoja matka")
        handler.call
      end
    end

    context "synonyms wanted" do
      let(:handler) do
        response_body = File.open('spec/fixtures/text_response').read
        Termit::TextResponseHandler.new(response_body, true)
      end

      it "extracts data from HTTP response body" do
        expect(STDOUT).to receive(:puts).with("Twoja matka")
        handler.call
      end
    end
  end
end

