require './lib/journey.rb'

describe Journey do
  subject(:journey) { described_class.new }
  let(:card) { double :card }
  let(:station) { "Bank" }

  it 'starts with no history' do
    expect(journey.history).to eq []
  end

  it 'gets entry_station' do
    # card.touch_in(station)
    expect(journey.entry_station(station)).to eq station
  end

  it 'get exit_station' do
    expect(journey.exit_station(station)). to eq station
  end

  # it 'records if journey is complete or not' do
  #
  # end
  #
  # it 'calculates fare' do
  #
  # end
  #
  it 'creates journey_history' do
    expect(journey.history).to eq [{station => station}]
  end


end
