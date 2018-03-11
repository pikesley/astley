describe Astley do
  context 'fetch data' do
    it 'gets clicks data', :vcr do
      expect(Astley.fetch_clicks).to eq [
        '1520709540' => 1
      ]
    end
  end

  context 'reconcile data' do
    it 'prepares tweets', :vcr do
      expect(Astley::TwitterClient.instance.client).to receive(:update).with (
        'Somebody got Rickrolled at 16:27 on 2018-03-11'
      )
      Astley.send_tweets
    end
  end
end
