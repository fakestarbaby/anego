# Anego

Ruby wrapper for the [App Annie API](https://support.appannie.com/hc/en-us/articles/204208844-Welcome-Index-)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'anego'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install anego

## Usage

```
# Initialization
client = Anego::Client.new

# Accounts API
response = client.accounts
#=> GET /accounts

accounts = response.body.accounts
account = accounts.first

# Products API
response = client.products(account.account_id)

products = response.body.products
product = products.first

# Product Ratings API
response = client.product_ratings(product.market, product.product_id)

# Product Reviews API
response = client.product_reviews(product.market, product.product_id, "2016-01-01", "2016-04-01", "JP")

```

## ENV

```
APP_ANNIE_API_KEY - App Annie API Key
```
