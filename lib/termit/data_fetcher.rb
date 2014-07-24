#encoding: UTF-8
require 'net/http'
require 'uri'

module Termit
  class DataFetcher
    extend ::Delegation
    @output_manager = Termit::OutputManager.new
    delegate :display_no_internet_msg, to: @output_manager

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
      http.request(request)
    rescue SocketError
      display_no_internet_msg
    end
  end
end