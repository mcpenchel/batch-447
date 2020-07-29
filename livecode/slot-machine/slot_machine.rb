class SlotMachine
  def initialize(reels)
    @reels = reels

    @game_rules = {
      'joker' => 50,
      'star' => 40,
      'bell' => 30,
      'seven' => 20,
      'cherry' => 10
    }
  end

  def score
    return @game_rules[@reels.first] if @reels.uniq.size == 1

    if @reels.uniq.size == 2
      joker_qty = @reels.count { |reel| reel == 'joker' }
      return @game_rules['joker'] / 2 if joker_qty == 2

      if joker_qty == 1
        non_joker_reel = @reels.reject { |reel| reel == 'joker' }.first
        return @game_rules[non_joker_reel] / 2
      end
    end

    0
  end
end
