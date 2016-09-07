#encoding: UTF-8
require 'rest-client'

module Termit
  class DataFetcherBase
    include CanOutput
    delegate :display_invalid_data_msg, :display_error_msg,  to: :output_manager

    def initialize url, text
      @url = url
      @text = text
    end

    def data
      send_request
    rescue RestClient::BadRequest
      raise if ENV['DEBUG']
      display_invalid_data_msg
    rescue RestClient::Exception, SocketError
      raise if ENV['DEBUG']
      display_error_msg
    end

    private

    def self.auth_cookies
      @@_auth_cookies ||= RestClient.get('https://www.bing.com/translator').cookies
    end
  end
end
