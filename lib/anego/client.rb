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

    def product_details(market, product_id)
      request :get, "/apps/#{market}/app/#{product_id}/details"
    end

    def product_ratings(market, product_id)
      request :get, "/apps/#{market}/app/#{product_id}/ratings"
    end

    def product_reviews(market, product_id, start_date, end_date, country)
      request :get, "/apps/#{market}/app/#{product_id}/reviews", {
        start_date: start_date,
        end_date: end_date,
        countries: country
      }
    end

    def product_ranks(market, product_id, start_date, end_date, country, category)
      request :get, "/apps/#{market}/app/#{product_id}/ranks", {
        start_date: start_date,
        end_date: end_date,
        countries: country,
        category: category
      }
    end

    private

    def request(method, path, params = {})
      Anego::Response.new(execute(method, path, params))
    end

    def execute(method, path, params)
      begin
        RestClient::Request.execute(
          method: method,
          url: api_endpoint(path),
          headers: headers(params),
        )
      rescue RestClient::ExceptionWithResponse => err
        raise err
      end
    end

    def api_endpoint(path)
      "#{API_ENDPOINT}#{path}"
    end

    def headers(params)
      params.empty? ? default_headers : default_headers.merge(params: params)
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
