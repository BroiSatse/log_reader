describe Statistic::UniqueVisitsPerPath do
  it 'has a right description' do
    expect(described_class.description).to eq 'list of webpages with most unique page views'
  end

  it 'has a right unit' do
    expect(described_class.unit).to eq 'unique visits'
  end

  describe '#process' do
    let(:count) { rand 3..5 }
    let(:path) { FFaker::Lorem.words(2).join '/' }
    let(:addresses) { count.times.map { FFaker::Internet.ip_v4_address }.uniq }
    let(:address) { addresses.sample }
    let(:record) { double(path: path, address: address) }

    it 'does not count duplicate records' do
      expect { count.times { subject.process record }}.to change { subject.result[path] }.by 1
    end

    it 'does count distinct addresses per path' do
      expect do
        addresses.each {|address| subject.process double(path: path, address: address)}
      end.to change { subject.result[path] }.by count
    end

  end
end