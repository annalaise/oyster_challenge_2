require './lib/oystercard.rb'

describe Oystercard do
  subject(:card) { described_class.new(journey) }
  let(:top_up) { 50 }
  let(:max_balance) { described_class::MAX_BALANCE }
  let(:minumum_balance) { 1 }

  let(:station) { double "station" }
  let(:journey) { double :journey, entry_station: station, exit_station: station, calc_fare: 1}
  let(:incomplete_journey) { double :journey, entry_station: station, exit_station: nil, calc_fare: 6}

  it 'creates card' do
   expect(card).to respond_to(:balance)
  end

  it 'has initial balance of 0' do
    expect(card).to have_attributes(balance: 0)
  end

  context 'topping up' do
    it 'increments the card balance' do
      expect { card.top_up(top_up) }.to change { card.balance }.by top_up
    end

      it 'enforces max balance of £90' do
        expect { card.top_up(max_balance + 1) }.to raise_error ("Top up limit is £#{max_balance}")
      end
  end

  context 'has funds' do
    before { card.top_up(max_balance) }

      describe '#touch_in' do

          it "requires a minimum balance on a card to start a journey" do
            expect(card.balance).to satisfy { |balance| balance >= minumum_balance }
          end
        end
      end

    context 'touching out' do
      before { card.touch_out(station) }

      it 'deducts an amount from the balance when touching out' do
        expect { card.touch_out(station) }.to change {card.balance }.by -journey.calc_fare
      end
    end
end
