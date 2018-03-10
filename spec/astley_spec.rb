describe Astley do
  it 'has a version number' do
    expect(Astley::VERSION).not_to be nil
  end

  context 'fetch data' do
    it 'gets clicks data', :vcr do
      expect(Astley.fetch_clicks).to eq [
        '1520698320' => 1
      ]
    end

    it 'gets countries data', :vcr do
      expect(Astley.fetch_countries).to eq ({
        GB: 1
      })
    end
  end

  context 'reconcile data' do
    it 'looks up countries' do
      expect(Astley.lookup :DE).to eq 'Germany'
      expect(Astley.lookup :GB).to eq 'the UK'
      expect(Astley.lookup :US).to eq 'the USA'
    end

    it 'matches clicks with locations', :vcr do
      expect(Astley.assemble_data).to eq [
        {
          country: :DE,
          timestamp: 1520706300
        },
        {
          country: :DE,
          timestamp: 1520706360
        },
        {
          country: :GB,
          timestamp: 1520706360
        },
        {
          country: :US,
          timestamp: 1520706420
        },
        {
          country: :US,
          timestamp: 1520706480
        }
      ]
    end
  end
end
