require 'httpclient'
require 'yajl'

module Duraflame
  # Wraps HTTPClient with knowledge of hostname and authentication
  class Client
    def initialize(company, token)
      @http_client = HTTPClient.new
      @http_client.set_auth(nil, token, nil)
      @uri = URI.parse("https://#{company}.campfirenow.com")
    end

    def get(path)
      uri = @uri.dup
      uri.path = path
      body = @http_client.get_content(uri)
      Yajl::Parser.parse(body)
    end
  end
end
