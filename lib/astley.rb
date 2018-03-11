require 'dotenv'
require 'httparty'
require 'twitter'

require 'singleton'
require 'json'

require 'astley/version'
require 'astley/twitter_client'

Dotenv.load

module Astley
  BASE_URL = 'https://api-ssl.bitly.com'

  def self.url path, extra_qs = {}
    qs = {
      access_token: ENV['token'],
      link: ENV['link'],
      timezone: ENV['tz_offset'],
      unit: 'minute',
      units: ENV['interval']
    }

    qs.merge! extra_qs

    '%s%s?%s' % [
      BASE_URL,
      path,
      qs.map { |k, v| "#{k.to_s}=#{v}" }.join('&')
    ]
  end

  def self.clicks_url
    self.url '/v3/link/clicks', {rollup: false}
  end

  def self.get url
    JSON.parse HTTParty.get(url, {
      headers: {
        Accept: 'application/json'
      }
    }).body
  end

  def self.fetch_clicks
    (self.get self.clicks_url)['data']['link_clicks'].select { |h|
      h['clicks'] > 0
    }.map { |h|
      { "#{h['dt']}" => h['clicks'] }
    }.reverse
  end

  def self.listify_clicks
    self.fetch_clicks.map { |t| [t.keys[0]] * t.values[0] }.flatten
  end

  def self.send_tweets
    self.listify_clicks.each do |timestamp|
      tweet = 'Somebody got Rickrolled at %s' % [
        DateTime.strptime(timestamp, '%s').strftime('%H:%M on %Y-%m-%d')
      ]
      TwitterClient.instance.client.update tweet
    end
  end
end
