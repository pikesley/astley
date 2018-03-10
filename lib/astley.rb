require 'dotenv'
require 'httparty'
require 'countries'

require 'json'

require 'astley/version'

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

  def self.countries_url
    self.url '/v3/link/countries'
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

  def self.fetch_countries
    (self.get self.countries_url)['data']['countries'].map { |c|
      [c['country'].to_sym, c['clicks']]
    }.to_h
  end

  def self.lookup symbol
    case symbol
    when :GB
      return 'the UK'
    when :US
      return 'the USA'
    else
      ISO3166::Country.new(symbol).name
    end
  end

  def self.assemble_data
    clicks = self.fetch_clicks.map { |t| [t.keys[0]] * t.values[0] }.flatten
    countries = self.fetch_countries

    data = []
    countries.to_a.map{ |u| [u[0]] * [u[1]][0] }.flatten.each do |symbol|
      data.push({
        country: symbol,
        timestamp: clicks.shift.to_i
      })
    end

    data
  end
end
