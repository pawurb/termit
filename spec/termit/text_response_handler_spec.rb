#encoding: UTF-8
require 'spec_helper'

describe Termit::TextResponseHandler do
  describe "call method" do
    let(:handler) do
      response_body = File.open('spec/fixtures/text_response').read
      Termit::TextResponseHandler.new(response_body)
    end

    it "extracts data from HTTP response body" do
      expect($stdout).to receive(:puts).with("Ass")
      handler.call
    end
  end
end
