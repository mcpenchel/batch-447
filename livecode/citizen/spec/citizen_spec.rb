require_relative '../citizen'

describe Citizen do
  describe '#can_vote?' do
    it 'returns true if age >= 18' do
      some_citizen = Citizen.new('Adult Matt', 'Penchel', 31)

      expect(some_citizen.can_vote?).to eq(true)
    end

    it 'returns false if age < 18' do
      some_citizen = Citizen.new('Tiny Matt', 'Penchel', 17)

      expect(some_citizen.can_vote?).to eq(false)
    end
  end

  describe '#full_name' do
    it 'returns the full name' do
      some_citizen = Citizen.new('Matheus', 'Penchel', 31)

      expect(some_citizen.full_name).to eq('Matheus Penchel')
    end
  end
end
