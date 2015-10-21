describe Statistic::Base do
  let(:described_class) { Class.new(super()) }

  describe '.description' do
    let(:new_description) { FFaker::BaconIpsum.sentence }
    it 'acts as setter-getter' do
      expect { described_class.description new_description }.to change { described_class.description }.from(nil).to new_description
    end
  end

  describe '.unit' do
    let(:new_unit) { FFaker::HipsterIpsum.word }
    it 'acts as setter-getter' do
      expect { described_class.unit new_unit }.to change { described_class.unit }.from(nil).to new_unit
    end
  end
end