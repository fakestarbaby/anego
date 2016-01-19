module Anego
  class Response
    def initialize(response)
      @raw_body = Hashie::Mash.new JSON.parse(response.to_s)
      @raw_headers = Hashie::Mash.new(response.headers)
      @raw_status = response.code
    end

    def body
      @raw_body
    end

    def headers
      @raw_headers
    end

    def status
      @raw_status
    end
  end
end
