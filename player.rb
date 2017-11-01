class Player
  attr_reader :name
  attr_reader :hand
  attr_reader :score
  attr_accessor :bank

  def initialize(name, initial_bank)
    @name = name
    @hand = {}
    @score = 0
    @bank = initial_bank
  end

  def hit(card)
    hand << card
    score += card.score
  end
end
