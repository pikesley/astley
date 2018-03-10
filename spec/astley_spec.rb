describe Astley do
  it 'has a version number' do
    expect(Astley::VERSION).not_to be nil
  end

  context 'assemble URLs' do
    specify 'Clicks URL' do
      ENV['token'] = 'faketoken'
      ENV['link'] = 'http://example.com'
      ENV['tz_offset'] = 0
      expect(Astley.clicks_url).to eq 'https://api-ssl.bitly.com/v3/link/clicks?access_token=faketoken&link=http://example.com&timezone=0&unit=minute&units=60&rollup=false'
    end

    specify 'Countries URL' do
      expect(Astley.countries_url).to eq 'https://api-ssl.bitly.com/v3/link/countries?access_token=faketoken&link=http://example.com&timezone=0&unit=minute&units=60'
    end
  end
end
