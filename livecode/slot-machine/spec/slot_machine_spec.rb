require_relative '../slot_machine'

describe SlotMachine do
  describe '#score' do
    GAME_RULES = {
      'star' => 40,
      'bell' => 30,
      'seven' => 20,
      'cherry' => 10
    }

    it 'returns 50 if we have 3 jokers' do
      slot_machine = SlotMachine.new(['joker', 'joker', 'joker'])

      expect(slot_machine.score).to eq(50)
    end

    GAME_RULES.each do |key, value|
      it "returns #{value} if we have 3 #{key}" do
        slot_machine = SlotMachine.new([key, key, key])

        expect(slot_machine.score).to eq(value)
      end

      it "returns #{value / 2} if we have 1 joker and 2 #{key}" do
        slot_machine = SlotMachine.new([key, key, 'joker'])

        expect(slot_machine.score).to eq(value / 2)
      end

      it "returns 25 if we have 2 jokers and 1 #{key}" do
        slot_machine = SlotMachine.new([key, 'joker', 'joker'])

        expect(slot_machine.score).to eq(25)
      end
    end
  end
end
