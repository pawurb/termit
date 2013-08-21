require 'net/http'
require 'uri'

module Termislator
  class DataFetcher
    def initialize url, text
      @url = url
      @text = text
    end

    def data
      send_request
    end

    private
      def send_request
        uri = URI.parse @url
        http = Net::HTTP.new(uri.host, uri.port)
        request = Net::HTTP::Post.new(uri.request_uri)
        request.set_form_data(text: @text)
        response = http.request(request)
        response
      end
  end
end