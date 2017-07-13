require './lib/oystercard.rb'

describe Oystercard do
  subject(:card) { described_class.new(journey) }
  let(:top_up) { 50 }
  let(:max_balance) { described_class::MAX_BALANCE }
  let(:minumum_balance) { 1 }
  let(:station) { double "station" }
  let(:journey) { double :journey, entry_station: station, exit_station: station, calc_fare: 1 }

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
      before do
        card.top_up(max_balance)
        card.touch_in(station)
        card.touch_out(station)
      end
      it 'deducts an amount from the balance when touching out' do
        expect { card.charge }.to change {card.balance }.by -journey.calc_fare
      end
    end

    context 'does not has funds' do
        describe '#touch_in' do
            it "does not allow entry if balance is 0" do
              expect{ card.touch_in(station) }.to raise_error "Insufficient funds"
            end
          end
        end

    context 'incomplete journey: did not touch out' do
      let(:card2) { Oystercard.new(journey) }
      let(:journey) { double :journey, entry_station: station, exit_station: nil, calc_fare: 6 }
      before do
        card2.top_up(max_balance)
      end
       it 'charges penalty fare' do
         expect{ card2.charge }.to change {card2.balance}.by -journey.calc_fare
       end
    end



end
