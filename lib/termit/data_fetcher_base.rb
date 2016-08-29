#encoding: UTF-8
require 'rest-client'

module Termit
  class DataFetcherBase
    include CanOutput
    delegate :display_no_internet_msg, :display_invalid_data_msg, to: :output_manager

    def initialize url, text
      @url = url
      @text = text
    end

    def data
      send_request
    rescue RestClient::BadRequest
      display_invalid_data_msg
    rescue RestClient::Exception
      display_error_msg
    end

    private

    def self.auth_cookies
      @@_auth_cookies ||= RestClient.get('https://www.bing.com/translator').cookies
    end
  end
end
