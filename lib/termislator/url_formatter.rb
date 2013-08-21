module Termislator
  class UrlFormatter
    def initialize request_options
      @request_options = request_options
    end

    def url
      construct_url
    end

    private

      def construct_url
        data = @request_options
        "http://translate.google.com/?tl=#{data[:target_lang]}&sl=#{data[:source_lang]}&ie=UTF-8&oe=UTF-8"
      end
  end
end