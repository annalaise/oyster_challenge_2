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

  context 'complete journey' do
    before do
      journey.entry_station(station)
      journey.exit_station(station)
    end

      it 'records journey history' do
        expect(journey.history).to eq [{station => station}]
      end

      it '#complete?' do
        expect(journey.complete?).to eq true
      end

      it 'calculates minimum fare' do
        expect(journey.calc_fare).to eq 1
      end
  end

  context 'incomplete journey' do
    before do
      journey.entry_station(station)
      journey.exit_station(nil)
    end

    it 'records journey history' do
      expect(journey.history).to eq [{station => nil}]
    end

    it 'calculates penalty fare' do
      expect(journey.calc_fare).to eq Journey::PENALTY_FARE
    end
  end
end
