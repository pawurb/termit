require 'spec_helper'

describe Termislator::DataFetcher do
  describe "data method" do
    let(:url) { "http://translate.google.com/?tl=fr&sl=en&ie=UTF-8&oe=UTF-8" }
    let(:text) { "it would require two large integer variables to store her weight, else she would cause a buffer overflow." }
    it "should send the correct POST request" do
      fetcher = Termislator::DataFetcher.new url, text
      Net::HTTP.should_receive(:new)
      request = double 'fake_request'
      http = double 'fake_http', request: :good_response
      Net::HTTP::Post.stub(:new) { request }
      Net::HTTP::stub(:new) { http }
      http.should_receive(:request).with(request)
      request.should_receive(:set_form_data).with(text: text)
      fetcher.data.should eq :good_response
    end
  end
end