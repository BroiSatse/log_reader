describe Statistic::VisitsPerPath do
  it 'has a right description' do
    expect(described_class.description).to eq 'list of webpages with most page views'
  end

  it 'has a right unit' do
    expect(described_class.unit).to eq 'visits'
  end

  describe '#process' do
    let(:path) { FFaker::Lorem.words(2).join '/' }
    let(:record) { double(path: path) }
    let(:count) { rand 3..5 }

    it 'increases the count of visit for given path' do
      expect { count.times {subject.process record }}.to change {subject.result[path] }.by count
    end
  end
end