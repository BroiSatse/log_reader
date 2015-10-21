describe Presenter::Console do

  describe '#display_single' do
    let(:output) { StringIO.new }
    before { $stdout = output }
    after { $stdout = STDOUT }

    let(:result) { FFaker::Lorem.words(10).zip([*0..10].shuffle).to_h }
    let(:unit) { 'units' }
    let(:description) { 'desc' }
    let(:statistic) { double(result: result, class: double(unit: unit, description: description)) }

    it 'displays the description of the statistic in the first line' do
      subject.display_single statistic
      output.rewind
      expect(output.gets.chomp).to eq description
    end

    it 'displays one line per entry in statistic results' do
      subject.display_single statistic
      output.rewind
      output.gets
      result.each do |key, value|
        expect(output.gets.chomp).to match /#{key}\W+#{value} #{unit}/
      end
    end
  end

  describe '#display' do
    let(:statistics) { Array.new(rand 3..5) { double }}
    it 'calls display_single for each given statistic' do
      displayed_statistics = []
      allow(subject).to receive(:display_single) {|statistic| displayed_statistics << statistic }
      subject.display(statistics)
      expect(displayed_statistics).to eq statistics
    end
  end
end