require 'spec_helper'

describe Termislator::TextHandler do
  pending "TextHandler specs waitin"

  describe "call method" do
    it "extracts and prints data from HTTP response" do
      response_body = File.open('spec/fixtures/text_response').read
      handler = Termislator::TextHandler.new(response_body)
      expect(handler.call).to eq('Twoja matka')
    end



  end
end