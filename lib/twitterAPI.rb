class TwitterAPI

  require 'twitter'
  require 'dotenv'
  Dotenv.load

  def initialize
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["YOUR_CONSUMER_KEY"]
      config.consumer_secret     = ENV["YOUR_CONSUMER_SECRET"]
      config.access_token        = ENV["YOUR_ACCESS_TOKEN"]
      config.access_token_secret = ENV["YOUR_ACCESS_SECRET"]
    end
    @client = client
  end

  def search(keyword, sample_size=20)
    result = []
    @client.search(keyword, result_type: "recent").take(sample_size).collect do |tweet|
      result << tweet.text
    end
    result
  end


end
