require 'dotenv'

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
      units: 60
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
end
