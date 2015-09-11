#encoding: UTF-8
require 'net/http'
require 'uri'
require 'openssl'

module Termit
  class DataFetcher
    include CanOutput
    delegate :display_no_internet_msg, to: :output_manager
    silence_warnings do
      ::OpenSSL::SSL::VERIFY_PEER = ::OpenSSL::SSL::VERIFY_NONE
    end

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
      query = "q=#{URI::encode(@text)}"
      url = "#{uri.request_uri}&#{query}"
      request = Net::HTTP::Get.new(url)
      http.use_ssl = true
      http.request(request)
    rescue SocketError
      display_no_internet_msg
    end
  end
end
