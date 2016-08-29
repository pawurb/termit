#encoding: UTF-8

module Termit
  class TextFetcher < DataFetcherBase
    private

    def send_request
      RestClient.post(@url,
        text_payload,
        {
          :cookies => self.class.auth_cookies,
          'Content-Type' => 'application/json'
        }
      )
    end

    def text_payload
      "[{\"id\":#{rand(20168810)},\"text\":\"#{@text}\"}]"
    end
  end
end
