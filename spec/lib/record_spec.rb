describe Record do
  describe '.parse' do
    let(:path) { FFaker::Lorem.words(rand 2..3).join('/') }
    let(:address) { FFaker::Internet.ip_v4_address }
    let(:input) { "#{path} #{address}" }

    it 'returns instance of Record' do
      expect(described_class.parse input).to be_an_instance_of described_class
    end

    it 'sets correct path value' do
      expect(described_class.parse(input).path).to eq path
    end

    it 'sets correct address value' do
      expect(described_class.parse(input).path).to eq path
    end
  end
end