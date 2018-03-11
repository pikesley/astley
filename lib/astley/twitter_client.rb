module Astley
  class TwitterClient
    include Singleton

    def initialize
      @client = Twitter::REST::Client.new do |config|
        config.consumer_key  = ENV['consumer_key']
        config.consumer_secret = ENV['consumer_secret']
        config.access_token    = ENV['twitter_token']
        config.access_token_secret = ENV['twitter_secret']
      end
    end

    def client
      @client
    end
  end
end
