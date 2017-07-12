require 'station'

describe Station do
  subject(:station) {described_class.new(name,zone)}
  let(:name) {double :name}
  let(:zone)  {double :zone}

  it 'returns a zone of station' do
    expect(station.name).to eq name
  end
  it 'knows the name of the station' do
    expect(station.zone).to eq zone
  end
end
