#encoding: UTF-8
require 'rest-client'

module Termit
  class DataFetcherBase
    include CanOutput
    delegate :display_invalid_data_msg, :display_error_msg,  to: :output_manager
    DUMMY_AGENT = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36'.freeze

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
      @@_auth_cookies ||= begin
        res = RestClient::Request.execute(
          method: :get,
          url: 'https://www.bing.com/translator',
          headers: {
            'User-Agent' => DUMMY_AGENT
          }
        )
        shy_cookie = res.headers.fetch(:set_cookie)[0].split(';')[0]
        key, value = shy_cookie.split('=')
        res.cookies.tap do |cookies_param|
          cookies_param[key] = value
        end
      end
    end
  end
end
