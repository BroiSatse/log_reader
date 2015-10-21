describe Client do
  before { stub_const 'Record', double.as_null_object }

  describe '#add_statistic' do
    let(:fake_class) { Class.new }
    it 'adds new instance of passed class to the array of statistics' do
      expect { subject.add_statistic(fake_class) }.to change { subject.statistics }.by [instance_of(fake_class)]
    end
  end

  describe 'read_line' do
    let(:entry) { "#{FFaker::Lorem.words(2).join('/')} #{FFaker::Internet.ip_v4_address}" }
    let(:parsed_record) { double }
    let(:statistics) { Array.new(rand 2..3) { double }}
    before do
      allow(Record).to receive(:parse).with(entry).and_return parsed_record
      allow(subject).to receive(:statistics).and_return statistics
    end

    it 'passes parsed record to all registered statistics' do
      expect(statistics).to all receive(:process).with(parsed_record)
      subject.read_line entry
    end
  end

  describe 'read!' do
    let(:stream) { StringIO.new }
    let(:entries) { FFaker::Lorem.words(rand 5..10) }
    let(:output) { '' }

    before do
      entries.each {|entry| stream.puts entry }
      stream.rewind
      allow(subject).to receive(:read_line) {|line| output << line }
    end

    it 'calls read_line for each line in the stream' do
      subject.read! stream
      expect(output).to eq entries.join
    end
  end
end