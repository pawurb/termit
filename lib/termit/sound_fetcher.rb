#encoding: UTF-8

module Termit
  class SoundFetcher < DataFetcherBase
    private

    def send_request
      RestClient.get(
        @url,
        { cookies: self.class.auth_cookies }
      )
    end
  end
end
