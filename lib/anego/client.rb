module Anego
  class Client
    API_ENDPOINT = "https://api.appannie.com/v1.2"

    def initialize(api_key: nil)
      @api_key = api_key
    end

    def accounts
      request :get, "/accounts"
    end

    def products(account_id)
      request :get, "/accounts/#{account_id}/products"
    end

    def product_ratings(product)
      request :get, "/apps/#{product.market}/app/#{product.product_id}/ratings"
    end

    private

    def request(method, path)
      Anego::Response.new(execute(method, path))
    end

    def execute(method, path)
      begin
        RestClient::Request.execute(
          method: method,
          url: api_endpoint(path),
          headers: default_headers,
        )
      rescue RestClient::ExceptionWithResponse => err
        raise err
      end
    end

    def api_endpoint(path)
      "#{API_ENDPOINT}#{path}"
    end

    def default_headers
      {
        Accept: "application/json",
        Authorization: "Bearer #{api_key}",
      }
    end

    def api_key
      @api_key || ENV["APP_ANNIE_API_KEY"]
    end
  end
end
