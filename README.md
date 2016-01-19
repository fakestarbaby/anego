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
client.accounts
#=> GET /accounts
```

## ENV

```
APP_ANNIE_API_KEY - App Annie API Key
```
