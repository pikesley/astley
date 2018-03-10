describe Astley do
  it 'has a version number' do
    expect(Astley::VERSION).not_to be nil
  end

  context 'fetch data' do
    it 'gets clicks data', :vcr do
      expect(Astley.fetch_clicks).to eq [
        1520698320
      ]
    end

    it 'gets countries data', :vcr do
      expect(Astley.fetch_countries).to eq ({
        GB: 1
      })
    end
  end

  context 'reconcile data' do
    
  end
end
